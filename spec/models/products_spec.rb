require 'spec_helper'

#Product should do
describe Product do

  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:price) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:image_url) }
  it { should allow_mass_assignment_of(:stock) }

  it { should have_many(:order_products) }
  it { should have_many(:orders).through(:order_products) }

  # --------------------------
  # TESTING : Product
  # --------------------------

  describe ".new" do
    # before start
    before do
      @product = Product.new
    end

    it { should respond_to(:id) }
    it { should respond_to(:title) }
    it { should respond_to(:price) }
    it { should respond_to(:description) }
    it { should respond_to(:image_url) }
    it { should respond_to(:stock) }

  end #end of decribe ".new"


  describe ".create" do
    # before start
    before do
      @product = Product.create(:title => 'Delicious chicken', :price => 3.00, :description => 'not nil', :image_url => 'image.png', :stock => 10)
      @product2 = Product.new
    end

    it "should have a title" do
      @product.title.should_not be_nil
    end

    it "should have a price" do
      @product.price.should_not be_nil
    end

    it "should greater or equal than $0" do
      @product.price.should >= 0
    end

    it "should have a description" do
      @product.description.should_not be_nil
    end

    it "should have an image" do
      @product.image_url.should_not be_nil
    end

    it "should greater or equal than 0" do
      @product.stock.should >= 0
    end

    it "should not be valid" do
      @product2.valid?.should be_false
    end

  end #end of decribe ".create"

end #end of Product