class Location < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :activities, through: :events

  validates :name, :address, presence: :true
  validates :name, uniqueness: true 
  validates :address, uniqueness: true 
end
