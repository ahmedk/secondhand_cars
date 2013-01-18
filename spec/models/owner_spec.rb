require 'spec_helper'

describe Owner do
  before(:each) do
    @owner = Owner.new(:name => "Onwer", :email => "owner@email.com", :mobile => "01234568986", :phone => "12348344")
  end

  describe "failed save" do
    it "should invalidate an owner with missing name" do
      @owner.name = nil
      @owner.should_not be_valid
    end

    it "should invalidate an owner with missing email" do
      @owner.email = nil
      @owner.should_not be_valid
    end

    it "should invalidate an owner with missing mobile" do
      @owner.mobile = nil
      @owner.should_not be_valid
    end

    it "should invalidate an owner with wrong email" do
      @owner.email = "invalid"
      @owner.should_not be_valid
    end

    it "should invalidate an owner with repeated email" do
      @owner.email = Owner.first.email
      @owner.should_not be_valid
    end
  end

  describe "sucessful save" do
    it "should validate an owner with minimal data" do
      @owner.phone = nil
      @owner.should be_valid
    end

    it "should validate an owner with complete data" do
      @owner.should be_valid
    end
  end
end
