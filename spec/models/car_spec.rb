require 'spec_helper'

describe Car do
  describe "failed save" do
    before(:each) do
      @car = Car.new(:car_model_id => 1, :description => "A car", :year => "2009", :price => 30000, :doors => 2, :seats => 4)
    end

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

    it "should validate car with missing doors and seats" do
      @car.doors = nil
      @car.seats = nil
      @car.should be_valid
    end

    it "should validate car with complete data" do
      @car.should be_valid
    end
  end
end
