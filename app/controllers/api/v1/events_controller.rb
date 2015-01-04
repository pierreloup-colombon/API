class Api::V1::EventsController < Api::V1::BaseController

  before_filter :authenticate_user!, only: [:create]

  def index
    @events = Event.all

    render json: @events.as_json(except: [:created_at, :updated_at])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render_resource_created(@event)
    else
      render_resource_creation_failed(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :date
    )
  end
end
