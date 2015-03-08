class Api::V1::TicketController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  def create
    @ticket = Ticket.new(shop_params)

    if @ticket.save
      render_resource_successed(@ticket)
    else
      render_resource_failed(@ticket)
    end
  end
end
