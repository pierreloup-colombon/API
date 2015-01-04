class Api::V1::EventsController < Api::V1::BaseController

  before_action :authenticate_user!, only: [:create, :update]
  before_action :set_event, only: [:update, :show] #[:show, :edit, :update, :destroy]

  def index
    @events = Event.all

    render json: @events.as_json(except: [:created_at, :updated_at])
  end

  def show
    render json: @event.as_json(except: [:created_at, :updated_at])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render_resource_successed(@event)
    else
      render_resource_failed(@event)
    end
  end

  def update
    if @event.update(event_params)
      render_resource_successed(@event)
    else
      render_resource_failed(@event)
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :date
    )
  end
end
