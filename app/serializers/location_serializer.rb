class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address
  has_many :events
  has_many :activities, through: :events
end
