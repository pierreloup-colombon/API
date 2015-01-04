class Api::V1::ShopsController < Api::V1::BaseController

  # before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_shop, only: [:update, :show, :destroy]


  def index
    @shops = Shop.where(event_id: params[:event_id])

    render json: @shops.as_json
  end

  private

  def set_shop
    @shop = Shop.find(shop_params)
  end

  def shop_params
    params.require(:event).permit(
      :event_id
    )
  end
end
