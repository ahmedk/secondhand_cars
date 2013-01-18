require 'spec_helper'

describe Car do
    before(:each) do
      @car = Car.new(:car_model_id => 1, :description => "A car", :year => "2009", :price => 30000, :doors => 2, :seats => 4, :owner_id => 1, :mileage => 3000, :transmission => "Manual", :type => "Sedan", :color => "Black", :capacity => 1600)
    end
  describe "failed save" do
    it "should invalidate car with missing car model" do
      @car.car_model_id = nil
      @car.should_not be_valid
    end

    it "should invalidate car with missing description" do
      @car.description = nil
      @car.should_not be_valid
    end

    it "should invalidate car with missing year" do
      @car.year = nil
      @car.should_not be_valid
    end

    it "should invalidate car with missing price" do
      @car.price = nil
      @car.should_not be_valid
    end

    it "should invalidate car with wrong doors" do
      @car.doors = "text"
      @car.should_not be_valid
    end

    it "should invalidate car with wrong seats" do
      @car.seats = "text"
      @car.should_not be_valid
    end

    it "should invalidate car with wrong transmission" do
      @car.transmission = "Invalid"
      @car.should_not be_valid
    end

    it "should invalidate car with wrong type" do
      @car.type = "Invalid"
      @car.should_not be_valid
    end

    it "should invalidate car with wrong mileage" do
      @car.mileage = "text"
      @car.should_not be_valid
    end

    it "should invalidate car with wrong capacity" do
      @car.capacity = "text"
      @car.should_not be_valid
    end
  end

  describe "successful save" do
    it "should validate car with minimum data" do
      @car = Car.new(:car_model_id => 1, :description => "A car", :year => "2009", :price => 30000, :owner_id => 1)
      @car.valid?
      @car.errors.full_messages
      @car.should be_valid
    end

    it "should validate car with complete data" do
      @car.should be_valid
    end
  end
end
