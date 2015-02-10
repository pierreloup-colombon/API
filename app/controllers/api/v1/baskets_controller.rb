class Api::V1::BasketsController < Api::V1::BaseController
  before_action :authenticate_user!, only: [:create]

  def create
    if params[:product_ids].not_present? || params[:vendor_ids].not_present?
      render_missing_parameters
      return
    end

    @basket = Basket.new(shop_id: params[:shop_id], product_ids: param[:product_ids])
    @basket.total = Product.where(id: params[:product_ids]).sum(:price)
    @basket.save!

    render nothing: true, status: :created
  end
end
