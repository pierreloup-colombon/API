class Api::V1::ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_activities, only: [:update, :destroy]

  def index
    @activities = Activities.where(event_id: params[:event_id])

    render json: @activities
  end

  def create
    @activity = Activities.new(activity_params)
    @activity.event_id = params[:event_id]

    if @activity.save
      render_resource_successed(@activity)
    else
      render_resource_failed(@activity)
    end
  end

  def destroy
    authorize! :destroy, @activity
    destroy_resource(@activity)
  end

  def update
    authorize! :update, @activity
    if @activity.update_attributes(activity_params)
      render_resource_successed(@activity)
    else
      render_resource_failed(@activity)
    end
  end
  def destroy
    authorize! :destroy, @activity
    destroy_resource(@activity)
  end

  private

  def set_activities
    @activity = Activities.find(param[:id])
  end

  def activity_params
    params.require(:activity).permit(
      :name,
      :description,
      :start_at,
      :end_at
    )
  end
end
