class Api::V1::TicketController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # before_action :set_activity, only: [:create]
  before_action :set_ticket, only: [:update, :show, :destroy]

  def index
    @tickets = Ticket.where(activity_id: params[:activity_id])
    render json: @tickets.as_json
  end

  def create
    @ticket = Ticket.new(ticket_params)
    #@ticket.activity_id = @activity.id

    if @ticket.save
      render_resource_successed(@ticket)
    else
      render_resource_failed(@ticket)
    end
  end

  def update
    authorize! :update, @ticket

    if @ticket.update_attributes(ticket_params)
      render_resource_successed(@ticket)
    else
      render_resource_failed(@ticket)
    end
  end

  def destroy
    authorize! :destroy, @ticket

    destroy_resource(@ticket)
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

=begin
  def set_activity
    @activity = Activity.find_by_id(params[:activity_id])

    if @activity.nil?
      render_nested_resource_doesnt_exists("Activity #{params[:activity_id]}")
    end
  end
=end

  def ticket_params
    params.require(:@ticket).permit(
        :name,
        :description,
        :price,
        :currency,
        :places,
        :activity_id
    )
  end
end
