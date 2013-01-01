require 'spec_helper'

describe CarController do
  before(:each) do
    @car = Car.new(:car_model_id => 1, :description => "A car", :year => "2009", :price => 30000, :doors => 2, :seats => 4)
  end

  describe "GET 'index'" do
    it "should list all cars" do
      Car.should_receive(:all)
      get 'index'
    end
  end

  describe "GET 'details'" do
		it "should load correct car" do
      Car.should_receive(:find).with("1")
      get 'details', :id => 1
    end

    it "should display car page" do
      Car.stub(:find).and_return(@car)
			get 'details', :id => 1
			page.should have_content('Details')
		end
  end

	describe "Get 'new'" do
		it "should display new car page" do
			get 'new'
			page.should have_content('Create')
		end
	end

  describe "Get 'edit'" do
    it "should load correct car for edit page" do
      Car.should_receive(:find).with("1")
			get 'edit', :id => 1
    end

    it "should display edit page" do
			get 'edit', :id => 1
			page.should have_content('Edit')
		end
  end
end
