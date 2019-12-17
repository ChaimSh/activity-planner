class Event < ApplicationRecord
    belongs_to :location
    belongs_to :activity
    
    validates :name, :date, presence: true
    validates_associated :activity, :location
    
    
    
    scope :number_of_located_events, -> {joins(:location).count}

    
    
    def activity_attributes=(activity_params)
      activity = Activity.find_or_create_by(activity_params)
      activity_params[:name].empty? ? self.activity : self.activity = activity 
    end 
    
    
    def datetime
        self.date.strftime("%A, %b %d") if self.date
    end








end
