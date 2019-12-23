class Event < ApplicationRecord
    belongs_to :location
    belongs_to :activity
    
    validates :name, :date, presence: true
    validates_associated :activity, :location
    
    # scope :by_location, -> (location_id) {where("location_id = ?", location_id)}
    # scope :by_activity, -> (activity_id) {where("activity_id = ?", activity_id)}
    scope :number_of_located_events, -> {joins(:location).count}

    
    
    def activity_attributes=(activity_params)
      activity = Activity.find_or_create_by(activity_params)
      # make sure if valid, then assign
      activity_params[:name].empty? ? self.activity : self.activity = activity 
    end 
    
    
    def datetime
        self.date.strftime("%A, %b %d") if self.date
    end

    def nested_activity_find_nested_resource
      params[:activity_id] && @activity = Activity.find_by_id(params[:activity_id])
    end







end
