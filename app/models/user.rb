class User < ApplicationRecord
  #JsonP settings attributes
  include Storext.model

  has_many :posts, dependent: :destroy
  has_many :post_comment, dependent: :destroy
  has_one :profile, dependent: :destroy

  after_create :init_profile

  belongs_to :role

  enum languages: { mn: 'mn', en: 'en' }

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

   def init_profile
     self.create_profile!
   end


 validates :language, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
