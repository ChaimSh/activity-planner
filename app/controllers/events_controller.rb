class EventsController < ApplicationController

    def number_of_located_events
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def index
        
        #check if nested                     #find nested resource
        if  params[:activity_id] && @activity = Activity.find_by_id(params[:activity_id])
            @events = @activity.events
             
        elsif params[:location_id] && @location = Location.find_by_id(params[:location_id])   
            @events = @location.events
        else
        @events = current_user.events
        # @events = Event.all
        end
        respond_to do |f|
            f.html {render :index}
            f.json { render json: @events}
        end
    end

    def new
      if  params[:activity_id] && @activity = Activity.find_by_id(params[:activity_id])
        @event = @activity.events.build
      else
        @event = Event.new
        @event.build_activity
      end
    end

    def create
        if  params[:activity_id] && @activity = Activity.find_by_id(params[:activity_id])
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

    def edit
        @event = Event.find_by(id: params[:id])
    end
    
    def update
        @event = Event.find_by(id: params[:id])
        if @event.update(event_params)
            redirect_to event_path(@event)
        else
            render :edit
        end
    end
   
    private 
    def event_params
      params.require(:event).permit(:name, :date, :location_id, :activity_id, :activity_attributes => [:name, :description, :duration, :user_id])
    end

    
end
