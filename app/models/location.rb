class Location < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :activities, through: :events

  validates :name, :address, presence: :true
  validates_uniqueness_of :name, :address, scope: :user_id 
 
end
