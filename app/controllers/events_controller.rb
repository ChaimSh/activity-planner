class EventsController < ApplicationController

    def number_of_located_events
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def index
        
        #check if nested                     #find nested resource
        if nested_activity_find_nested_resource
            @events = @activity.events
             #  @events = current_user.events.by_activity(params[:activity_id])
        elsif params[:location_id] && @location = Location.find_by_id(params[:location_id])   
            @events = @location.events
        else
        @events = current_user.events
        # @events = Event.all
        end
    end

    def new
      if nested_activity_find_nested_resource
        @event = @activity.events.build
      else
        @event = Event.new
        @event.build_activity
      end
    end

    def create
        if nested_activity_find_nested_resource
            @event = @activity.events.build(event_params)
        else
           @event = Event.new(event_params)
        end
        
        if @event.save
            redirect_to event_path(@event)
        else
            render :new
        end
    end

   
    private 
    def event_params
      params.require(:event).permit(:name, :date, :location_id, :activity_id, :activity_attributes => [:name, :description, :duration, :user_id])
    end

    def nested_activity_find_nested_resource
      params[:activity_id] && @activity = Activity.find_by_id(params[:activity_id])
    end
end
