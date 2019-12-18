class Location < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :activities, through: :events

  validates :name, :address, presence: :true
  validates_uniqueness_of :name, :address, scope: :user_id 
 
  scope :order_reverse, -> {order(name: :desc).first(4)}
  
  # def self.ordered_reverse
  #   a = self.order_reverse 
  #   a.each do |aa|
  #     aa.name
  #   end
  # end
end
