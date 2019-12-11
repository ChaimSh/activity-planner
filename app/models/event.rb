class Event < ApplicationRecord
    belongs_to :location
    belongs_to :activity


    validates :date, presence: true
    validates_associated :activity

    def activity_attributes=(activity_params)
      activity = Activty.find_or_create_by(activity_params)
      activity_params[:name].empty? ? self.activity : self.activity = activity 
    end 
    
    
    
    def datetime
        self.date.strftime("%A, %b %d") if self.date
    end








end
