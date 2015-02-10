class Api::V1::BasketsController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:create, :pay]

  def create
    if params[:product_ids].not_present? || params[:vendor_ids].not_present?
      render_missing_parameters
      return
    end

    @basket = Basket.new(shop_id: params[:shop_id], product_ids: param[:product_ids])
    @basket.total = Product.where(id: params[:product_ids]).sum(:price)
    @basket.save!

    render json: { basket: @basket.as_json(only: [:id, :total]) }
  end

  def pay
    # ToDo: Check user wristband
    # ToDo: Check sold
    @basket = Basket.find(params[:basket_id])
    @basket.status = Basket.statuses[:payed]
    @basket.save!

    render json: { basket: @basket.as_json(only: [:status]) }
  end
end
