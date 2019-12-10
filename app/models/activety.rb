class Activety < ApplicationRecord
  belongs_to :user
  has_many :sessions
  has_many :locations, through: :sessions
end
