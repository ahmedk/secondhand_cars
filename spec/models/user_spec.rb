require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new(:password => "12345", :password_confirmation => "12345", :owner_id => 1)
  end

  it { should respond_to(:authenticate) }

  describe "failed save" do
    it "should invalidate missing password" do
      @user.password = nil
      @user.should_not be_valid
    end

    it "should invalidate missing confirmation" do
      @user.password_confirmation = nil
      @user.should_not be_valid
    end

    it "should invalidate mismatch" do
      @user.password_confirmation = "mismatch"
      @user.should_not be_valid
    end

    it "should invalidate missing owner" do
      @user.owner_id = nil
      @user.should_not be_valid
    end
  end

  describe "successful save" do
    it "should validate correct user" do
      @user.should be_valid
    end
  end
end
