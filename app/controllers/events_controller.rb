class EventsController < ApplicationController


    def show
        @event = Event.find(params[:id])
    end

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
        @event.build_activity
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to event_path(@event)
        else
            render :new
        end
    end

    private 
    def event_params
    params.require(:event).permit(:name, :date, :activety_id, :activity_attributes[:name, :description, :duration, :user_id])
    end


end
