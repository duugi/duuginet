class User < ApplicationRecord

  #JsonP settings attributes
  include Storext.model

  has_many :posts, dependent: :destroy
  has_many :post_comment, dependent: :destroy
  has_one :user_profile, dependent: :destroy

  store :settings, coder: JSON


  # "settings" matches what we named the database column
  store_attributes :settings do
    time_zone String
    language String, default: 'mn'
    date_format String, default: 'Y-m-d'
    remember_country_selection Boolean, default: true
  end


     def username
     	return self.email.split('@')[0].capitalize
     end

     validates :email, presence: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
