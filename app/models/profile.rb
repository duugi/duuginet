class Profile < ApplicationRecord
    include Storext.model

  	belongs_to :user

  	store :extra, coder: JSON
  	store :address, coder: JSON
  	store :address_postal, coder: JSON

  	store_attributes :extra do
  	    website String
  	    twitter String
  	    facebook String
  	    linkedin String
  	    github String
  	end

  	store_attributes :address do
  	    number String
  	    building String
  	    street String
  	    suburb String
  	    city String
  	    state String
  	    country String
  	    zipcode String
  	end

  	store_attributes :address_postal do
  	    postal_number String
  	    postal_building String
  	    postal_street String
  	    postal_suburb String
  	    postal_city String
  	    postal_state String
  	    postal_country String
  	    postal_zipcode String
  	end

    def fullname
    	return "#{self.firstname} #{self.lastname}"
    end

  	#validates :firstname, presence: true
    	#validates :user_id, presence: true

    	#validates_uniqueness_of :identify_number
    #validates_uniqueness_of :phone_number

    has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
    # Validate filename
    validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
    # Explicitly do not validate
    do_not_validate_attachment_file_type :avatar

    validates_uniqueness_of :user_id, :message => "User can only have one Profile"
    validates :user_id, presence: true
end
