class User < ApplicationRecord
    has_many :locations
    has_many :located_activities, through: :locations, source: :activities 
    has_many :activities
    has_secure_password

    validates :username, :email, :password, presence: true
    validates :username, :email, uniquieness: true

end
