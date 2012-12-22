require 'spec_helper'

describe CarController do

  describe "GET 'index'" do
    it "should list all cars" do
      Car.should_receive(:all)
      get 'index'
    end
  end

  describe "GET 'details'" do
    it "should display car page" do
      Car.should_receive(:find).with(1)
      get 'details', :id => 1
    end
  end

end
