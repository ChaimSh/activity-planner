class Location < ApplicationRecord
  belongs_to :user
  has_many :sessions
  has_many :activities, through: :sessions

  validates :name, :address, presence: :true
  validates :name, uniqueness: {message: "sorry the name of this location exists already in the database"}
  validates :address, uniqueness: {message: "sorry this address exists already in the database"}
end
