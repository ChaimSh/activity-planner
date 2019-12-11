class EventsController < ApplicationController


    def show
        @event = Event.find(params[:id])
    end

    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
    end

    private 
    def event_params
    params.require(:event).permit(:name, :date, :activety_id, :activity_attributes:[:name, :description, :duration, :user_id])
    end


end
