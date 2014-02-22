require 'bcrypt'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  acts_as_voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :provider, :uid, :name, :admin
  # attr_accessible :title, :body
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   # assuming the user model has a name
        #user.image = auth.info.image # assuming the user model has an image
    end
  end

  has_many :doodles
end
