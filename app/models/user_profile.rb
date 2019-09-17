class UserProfile < ApplicationRecord
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

  	#validates :firstname, presence: true
    	#validates :user_id, presence: true

    	#validates_uniqueness_of :identify_number
    validates_uniqueness_of :phone_number
end
