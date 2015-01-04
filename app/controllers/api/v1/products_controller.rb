class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  before_action :set_product, only: [:update, :show, :destroy]
  before_action :set_shop, only: [:create]

  def index
    @products = Product.where(shop_id: params[:shop_id])

    render json: @products
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
end
