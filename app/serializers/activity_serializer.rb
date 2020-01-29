class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :duration
  has_many :events
  has_many :locations, through: :events
end
