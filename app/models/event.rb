class Event < ApplicationRecord
    belongs_to :location
    belongs_to :activity
    # , optional: :true
    validates :name, :date, presence: true
    validates_associated :activity, :location
    
    #already in activity.events
    scope :by_activity, -> (activity_id) {where("activity_id = ?", activity_id)}
    #scope future events
    #number of events location has
    
    
    def activity_attributes=(activity_params)
      activity = Activity.find_or_create_by(activity_params)
      activity_params[:name].empty? ? self.activity : self.activity = activity 
    end 
    
    
    def datetime
        self.date.strftime("%A, %b %d") if self.date
    end








end
