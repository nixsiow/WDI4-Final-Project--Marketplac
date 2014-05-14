require 'spec_helper'

#Order should do
describe Order do

  it { should allow_mass_assignment_of(:user_id) }

  it { should have_many(:order_products) }
  it { should have_many(:products).through(:order_products) }
  it { should belong_to(:user) }

  # --------------------------
  # TESTING : Order
  # --------------------------

  describe ".new" do
    # before start
    before do
      @order = Order.new
    end

    it { should respond_to(:id) }
    it { should respond_to(:user_id) }

  end #end of decribe ".new"


  describe ".create" do
    # before start
    before do
      user01 = User.create(:username => 'HappyUser1', :email => 'user1@user.com', :password => 'abcd1234', :password_confirmation => 'abcd1234')
      @order = user01.orders.create
    end

    it "should have an user id" do
      @order.user_id.should_not be_nil
    end

  end #end of decribe ".create"


  describe ".create" do
    # before start
    before do
      @order = Order.new
    end

    it "should not be valid" do
      @order.valid?.should be_false
    end

  end #end of decribe ".create"

end #end of Order