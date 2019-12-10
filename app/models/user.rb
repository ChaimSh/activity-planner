class User < ApplicationRecord
    has_many :locations
    has_many :activities, through: :locations
    has_many :activities
end
