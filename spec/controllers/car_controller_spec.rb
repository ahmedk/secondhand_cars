require 'spec_helper'

describe CarController do
  before(:each) do
    @car = Car.new(:car_model_id => 1, :description => "A car", :year => "2009", :price => 30000, :doors => 2, :seats => 4, :owner_id => 1)
  end

  describe "GET 'index'" do
    it "should list all cars" do
      Car.should_receive(:find).with(:all, :conditions => { :sold => false })
      get 'index'
    end
  end

  describe "GET 'details'" do
		it "should load correct car" do
      Car.should_receive(:find).with("1")
      get 'details', :id => 1
    end
  end

  describe "Get 'edit'" do
    it "should load correct car for edit page" do
      Car.should_receive(:find).with("1").and_return(@car)
			get 'edit', :id => 1
    end
  end
end
