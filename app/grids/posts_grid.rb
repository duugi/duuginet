class PostsGrid

  include Datagrid

  scope do
    Post.all
    #Post.desc(:created_at)
  end

  #filter :rating, :enum, :select => 0..10
  filter :title, :header => "Title (contains)" do |value|
    where(:title => /#{Regexp.escape(value)}/i)
  end
  filter :body, :header => "Author (regexp)" do |value|
    begin
      where(:body => Regexp.compile(value))
    rescue RegexpError
      where
    end
  end

  #filter :condition, :dynamic, :header => "Dynamic condition"
  column :title
  column :body
  #column :rating
  column :created_at do
    self.created_at.to_date
  end

end
