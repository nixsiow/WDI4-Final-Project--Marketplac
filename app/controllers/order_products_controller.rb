class OrderProductsController < ApplicationController
  before_action :set_order_product, only: [:show, :edit, :update, :destroy]

  # GET /order_products
  # GET /order_products.json
  def index
    # binding.pry
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
    # @order_product = OrderProduct.new(:quantity => params[:quantity], :product_id => params[:product_id])
    @order_product = OrderProduct.create(params[:order_product])

    respond_to do |format|
      if @order_product.save
        session[:cart] ||= []
        session[:cart].push @order_product.id

        output = {'status' => 'Item was successfully added to cart.'}.to_json

        format.html { redirect_to order_products_path, notice: 'Item was successfully added to cart.' }
        format.json { render :json => output }
      else
        format.html { render :new }
        format.json { render json: @order_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # User proceed to payment from here.
  def checkout
    #binding.pry
    @order = Order.create(:user_id => current_user.id) # Create a new order for this checkout.
    
    # Associate each item in the cart with the new order id.
    session[:cart].each do |order_product_id|
      item = OrderProduct.find order_product_id
      item.order_id = @order.id
      item.save
    end
    # clear the shopping cart at the end
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
    # clear the product id in Cart before destroying the orderproduct. Otherwise cause problem when redirect to the index page after that, because no longer can find the same product id again.
    session[:cart].delete(params[:id].to_i)
    # Destroy the item and redirect back to the same page.
    @order_product.destroy
    respond_to do |format|
      format.html { redirect_to order_products_url, notice: 'You have successfully removed one item from your shopping cart.' }
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
