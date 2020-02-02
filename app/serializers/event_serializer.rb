class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :date
  belongs_to :activity, serializer: ActivitySerializer
  belongs_to :location, serializer: LocationSerializer
end

