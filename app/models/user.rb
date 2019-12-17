class User < ApplicationRecord
    has_many :activities
    has_many :locations
    has_many :located_activities, through: :locations, source: :activities 
    has_many :events, through: :locations
    has_secure_password

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true


    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.user_name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
      end


end
