require 'spec_helper'

#OrderProduct should do
describe OrderProduct do

  it { should allow_mass_assignment_of(:order_id) }
  it { should allow_mass_assignment_of(:product_id) }
  it { should allow_mass_assignment_of(:quantity) }

  it { should belong_to(:order) }
  it { should belong_to(:product) }


  # --------------------------
  # TESTING : OrderProduct
  # --------------------------

  describe ".new" do
    # before start
    before do
      @order_products = OrderProduct.new
    end

    it { should respond_to(:id) }
    it { should respond_to(:order_id) }
    it { should respond_to(:product_id) }
    it { should respond_to(:quantity) }

  end #end of decribe ".new"


  describe ".create" do
    # before start
    before do
      user = User.create(:username => 'HappyUser1', :email => 'user1@user.com', :password => 'abcd1234', :password_confirmation => 'abcd1234')
      order = user.orders.create
      product01 = Product.create(:title => 'Item01', :price => 10.50, :description => 'some text', :image_url => 'image.png', :stock => 10)
      @order_products = order.order_products.create(:product_id => product01.id, :quantity => 10)
      @order_products2 = OrderProduct.new
    end

    it "should have an order_products id" do
      @order_products.id.should_not be_nil
    end

    it "should have an order_id" do
      @order_products.order_id.should_not be_nil
    end

    it "should have a product_id" do
      @order_products.product_id.should_not be_nil
    end

    it "should have a quantity" do
      @order_products.quantity.should_not be_nil
    end

    it "should not be valid" do
      @order_products2.valid?.should be_false
    end


  end #end of decribe ".create"

end #end of User