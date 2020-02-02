class Activity < ApplicationRecord
  has_many :events
  has_many :locations, through: :events
  belongs_to :user
  # belongs_to :category

  validates :name, :description, :duration, presence: :true
  validates_uniqueness_of :name, scope: :user_id 
 

  scope :order_by_longest_duration, -> { order(duration: :desc) }
  scope :duration_search, -> (search_duration){ where("duration > ?", search_duration)}




end
