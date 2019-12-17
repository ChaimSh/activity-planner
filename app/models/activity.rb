class Activity < ApplicationRecord
  has_many :events
  has_many :locations, through: :events
  belongs_to :user

  validates :name, :description, :duration, presence: :true
  validates_uniqueness_of :name, scope: :user_id 
 

  scope :order_by_longest_duration_first_four, -> { order(:duration).first(4) }
  



end
