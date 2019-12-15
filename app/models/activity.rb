class Activity < ApplicationRecord
  has_many :events
  has_many :locations, through: :events
  belongs_to :user
end
