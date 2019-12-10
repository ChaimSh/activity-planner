class User < ApplicationRecord
    has_many :locations
    has_many :located_activities, through: :locations, source: :activities 
    has_many :activities
end
