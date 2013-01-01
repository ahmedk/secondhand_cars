require 'spec_helper'

describe Car do
  describe "failed save" do
    before.each do
      @car = Car.new(:car_model_id => 1, :description => "A car", :year => "2009", :price => 30000, :doors => 2, :seats => 4)
    end
    it "should invalidate car with missing car model"
      @car.car_model_id = nil
      @car.should be(:invalid?)
    end

    it "should invalidate car with missing description"
      @car.description = nil
      @car.should be(:invalid?)
    end

    it "should invalidate car with missing year"
      @car.year = nil
      @car.should be(:invalid?)
    end

    it "should invalidate car with missing price"
      @car.price = nil
      @car.should be(:invalid?)
    end

    it "should invalidate car with wrong doors"
      @car.doors = "text"
      @car.should be(:invalid?)
    end

    it "should invalidate car with wrong seats"
      @car.seats = "text"
      @car.should be(:invalid?)
    end

    it "should validate car with missing doors and seats"
      @car.doors = nil
      @car.seats = nil
      @car.should be(:valid?)
    end

    it "should validate car with complete data"
      @car.should be(:valid?)
    end
  end
end
