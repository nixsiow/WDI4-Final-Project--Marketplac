require 'spec_helper'

#User should do
describe User do

  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:username) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }
  it { should allow_mass_assignment_of(:admin) }

  it { should have_many(:orders) }

  #username validation
  it { should validate_uniqueness_of(:username) }
  it { should ensure_length_of(:username).is_at_least(5).is_at_most(20) }

  # --------------------------
  # TESTING : User
  # --------------------------

  describe ".new" do
    # before start
    before do
      @user = User.new
    end

    it { should respond_to(:id) }
    it { should respond_to(:username) }
    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:admin) }

  end #end of decribe ".new"


  describe ".create" do
    # before start
    before do
      @user = User.create(:username => 'HappyUser1', :email => 'user1@user.com', :password => 'abcd1234', :password_confirmation => 'abcd1234')
    end

    it "should have an user id" do
      @user.id.should_not be_nil
    end

    it "should have a username" do
      @user.username.should_not be_nil
    end

    it "should have a email" do
      @user.email.should_not be == ''
    end

    it "should have a password" do
      @user.password.should_not be_nil
    end

    it "should have a password_confirmation" do
      @user.password_confirmation.should_not be_nil
    end

    it "should have an admin attribute and default as false" do
      @user.admin.should_not be_true
    end

  end #end of decribe ".create"

end #end of User