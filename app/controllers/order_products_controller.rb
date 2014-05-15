class OrderProductsController < ApplicationController
  before_action :set_order_product, only: [:show, :edit, :update, :destroy]

  # GET /order_products
  # GET /order_products.json
  def index
    if session[:cart]
      @order_products = OrderProduct.find session[:cart]
    else
      @order_products = []
    end
  end

  # GET /order_products/1
  # GET /order_products/1.json
  def show
    @order_products = OrderProduct.where()
  end

  # GET /order_products/new
  def new
    @order_product = OrderProduct.new
  end

  # GET /order_products/1/edit
  def edit
  end

  # POST /order_products
  # POST /order_products.json
  def create
    # @order_product = OrderProduct.new(order_product_params)
    # binding.pry
    @order_product = OrderProduct.new(:quantity => params[:quantity], :product_id => params[:product_id])

    respond_to do |format|
      if @order_product.save
        session[:cart] ||= []
        session[:cart].push @order_product.id
        # binding.pry

        format.html { redirect_to order_products_path, notice: 'Order product was successfully created.' }
        format.json { render :show, status: :created, location: @order_product }
      else
        format.html { render :new }
        format.json { render json: @order_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def checkout
    #binding.pry
    @order = Order.create(:user_id => current_user.id) # Create a new order for this checkout.
    #binding.pry
    # Associate each item in the cart with the new order id.
    session[:cart].each do |order_item_id|
      # item.order_id = http://order.id
      item = OrderProduct.find order_item_id
      item.order_id = @order.id
      item.save
    end
    session[:cart] = []
  end

  # PATCH/PUT /order_products/1
  # PATCH/PUT /order_products/1.json
  def update
    respond_to do |format|
      if @order_product.update(order_product_params)
        format.html { redirect_to @order_product, notice: 'Order product was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_product }
      else
        format.html { render :edit }
        format.json { render json: @order_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_products/1
  # DELETE /order_products/1.json
  def destroy
    @order_product.destroy
    respond_to do |format|
      format.html { redirect_to order_products_url, notice: 'Order product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_product
      @order_product = OrderProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_product_params
      params[:order_product]
    end
end
