class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :order]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET minimum packages with specific quantity
  def order
    data = @product.find_minimum_packages(params[:order][:quantity].to_i)
    @order_items = []
    unless data.nil?
      data.each_with_object(Hash.new(0)) { |item, counts| counts[item] += 1 }.each do |key, value|
        @order_items << Hash[ package_size: key, quantity: value, amount: (value.to_i * @product.packages.find_by_size(key).price) ]
      end
    end
    respond_to do |format|
      format.js
      format.json{render json: @order_items}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end


end

