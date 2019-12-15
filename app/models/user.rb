class User < ApplicationRecord
    has_many :activities
    has_many :locations
    has_many :located_activities, through: :locations, source: :activities 
    has_many :events, through: :locations
    has_secure_password

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true

end
