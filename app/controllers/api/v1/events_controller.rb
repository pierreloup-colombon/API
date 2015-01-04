class Api::V1::EventsController < ApplicationController

  def index
    @events = Event.all

    render json: @events.as_json(except: [:created_at, :updated_at])
  end
end
