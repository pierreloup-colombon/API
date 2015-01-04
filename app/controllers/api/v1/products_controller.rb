class Api::V1::ProductsController < Api::V1::BaseController
  # before_action :authenticate_user!, only: [:create, :update, :destroy]

  before_action :set_product, only: [:update, :show, :destroy]
  before_action :set_shop, only: [:create]

  include DestroyResourceWithStatus

  def index
    @products = Product.where(shop_id: params[:shop_id])

    render json: @products
  end

  def create
    @product = Product.new(product_params)
    @product.shop_id = params[:shop_id]

    if @product.save
      render_resource_successed(@product)
    else
      render_resource_failed(@product)
    end
  end

  def update
    authorize! :update, @product
    if @product.update_attributes(product_params)
      render_resource_successed(@product)
    else
      render_resource_failed(@product)
    end
  end

  def destroy
    authorize! :destroy, @product
    destroy_resource(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_shop
    @shop = Shop.find_by_id(params[:shop_id])

    if @shop.nil?
      render_nested_resource_doesnt_exists("Shop #{params[:shop_id]}")
    end
  end

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :quantity,
      :price,
      :shop_id,
    )
  end
end
