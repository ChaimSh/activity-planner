class Event < ApplicationRecord
    belongs_to :location
    belongs_to :activity
    
    validates :name, :date, presence: true
    #activity/location won't save unless event is valid 
    validates_associated :activity, :location
   
   
    scope :number_of_located_events, -> {joins(:location).count}

    
    #bringing in params from activity (the aactivityform withtin events)
    def activity_attributes=(activity_params)
      activity = Activity.find_or_create_by(activity_params)
      # make sure if valid, then set that activity, if not then set the one that exists
      # @activity.valid? ? self.activity = activity : self.activity
      # didn't fill out params
      activity_params[:name].empty? ? self.activity : self.activity = activity 
    end 
    
    
    def datetime
        self.date.strftime("%A, %b %d") if self.date
    end

    def nested_activity_find_nested_resource
      params[:activity_id] && @activity = Activity.find_by_id(params[:activity_id])
    end







end
