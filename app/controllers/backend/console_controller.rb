module Backend
  class ConsoleController < Backend::PreferenceController
    require 'yaml'

    def index

    end

    def show

      @id = params[:id]

      @what = case @id
      when "yaml"
        convert_to_tables
      when "seed"
        create_seed
      when "exec"
        execute_permission_seed
      else
        "Begins with something else"
      end

    end

    private
      def convert_to_tables
        @tables = ActiveRecord::Base.connection.tables

        @tables.delete("schema_migrations")
        @tables.delete("ar_internal_metadata")
        @tables.delete("user_profiles")
        @tables.delete("settings")
        @tables.delete("permittables")
        @tables.delete("admins")

        arr = []

        @tables.each do |table|
          arr << table.classify
        end

        counter = 0
                                # counter += 1 => {                                                                                                                                # :update, :destroy, :edit, :read
        @tables = arr.map { |n| { name: n, action: '', subject_class: n, subject_id: '', group_name: '', actions: ['is_export', 'is_import', 'only_user', 'only_location'], crud: ['read', 'create', 'update', 'destroy'] } }

        File.open(Rails.root.join("db/yml/generated/tables.yml"), "w") { |file| file.write(@tables.to_yaml) }

        return @tables.to_yaml
      end

      def create_seed
        seed_file = Rails.root.join('db', 'yml', 'tables.yml')
        tables = YAML::load_file(seed_file)
        counter = 0
        arr = []
        #puts tables
        tables.each do |c|
          puts "Create permission #{counter += 1} with name: #{c[:name]}"
          if c[:actions].size > 0 then
            c[:actions].each do |key,value|
              case key  # was case obj.class
              when "is_export"
                puts "#{c[:name]}.export"
                arr << permissionRow(c, "export")
              when "is_import"
                puts "#{c[:name]}.import"
                arr << permissionRow(c, "import")
              when "only_user"
                puts "#{c[:name]}.user"
                arr << permissionRow(c, "user")
              when "only_location"
                puts "#{c[:name]}.location"
                arr << permissionRow(c, "location")
              else
                puts "None"
              end
              #puts "ACTIONS: #{key} - #{value} "
            end
          end

          if c[:crud].size > 0 then
            c[:crud].each do |key,value|
              #puts "CRUD: - #{key} - #{value} "
              case key  # was case obj.class
              when "read"
                puts "#{c[:name]}.read"
                arr << permissionRow(c, "read")
              when "create"
                puts "#{c[:name]}.edit"
                arr << permissionRow(c, "create")
              when "update"
                puts "#{c[:name]}.update"
                arr << permissionRow(c, "update")
              when "destroy"
                puts "#{c[:name]}.destroy"
                arr << permissionRow(c, "destroy")
              else
                puts "None"
              end
            end
          end

          File.open(Rails.root.join("db/yml/generated/seed_permission.yml"), "w") { |file| file.write(arr.to_yaml) }

          # ACTIONS: is_export -
          # ACTIONS: is_import -
          # ACTIONS: only_user -
          # ACTIONS: only_location -
          # CRUD: - read -
          # CRUD: - edit -
          # CRUD: - update -
          # CRUD: - destroy -

        end

        return "Success SEED"
      end

      def permissionRow(obj, action)
        return { name: "#{obj[:name]}.#{action}", action: action, subject_class: obj[:subject_class], subject_id: '', group_name: obj[:group_name], enabled: true }
        #
        # t.string "name"
        # t.string "action"
        # t.string "subject_class"
        # t.string "subject_id"
        # t.string "group_name"
        # t.boolean "enabled"
      end

      def execute_permission_seed
        #Permission.delete_all
        ActiveRecord::Base.connection.execute("TRUNCATE public.permissions RESTART IDENTITY")
        ActiveRecord::Base.connection.execute("TRUNCATE public.permittables RESTART IDENTITY")

        seed_file = Rails.root.join('db', 'yml', 'generated', 'seed_permission.yml')
        data = YAML::load_file(seed_file)
        Permission.create!(data)
      end

      def eval_cancan_action(action)
        case action.to_s
        when "index", "show", "search"
          cancan_action = "read"
          action_desc = I18n.t :read
        when "create", "new"
          cancan_action = "create"
          action_desc = I18n.t :create
        when "edit", "update"
          cancan_action = "update"
          action_desc = I18n.t :edit
        when "delete", "destroy"
          cancan_action = "delete"
          action_desc = I18n.t :delete
        else
          cancan_action = action.to_s
          action_desc = "Other: " << cancan_action
        end
        return action_desc, cancan_action
      end

      def write_permission(class_name, cancan_action, name, description, force_id_1 = false)
        permission  = Permission.find(:first, :conditions => ["subject_class = ? and action = ?", class_name, cancan_action])
        if not permission
          permission = Permission.new
          permission.id = 1 if force_id_1
          permission.subject_class =  class_name
          permission.action = cancan_action
          permission.name = name
          permission.description = description
          permission.save
        else
          permission.name = name
          permission.description = description
          permission.save
        end
      end

  end
end
