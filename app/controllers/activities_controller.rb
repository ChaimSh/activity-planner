class ActivitiesController < ApplicationController
before_action :set_activity, only: [:show]
    
  def index
    @activities = Activity.all
  end

  def show
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
        redirect_to activity_path(@activity)
    else
        render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :duration)
  end

  def set_activity
    @activity = Activity.find_by(id: params[:id])
    redirect_to activities_path if !@activity
  end







end
