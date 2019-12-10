class Location < ApplicationRecord
  belongs_to :user
  has_many :sessions
  has_many :activities, through: :sessions
end
