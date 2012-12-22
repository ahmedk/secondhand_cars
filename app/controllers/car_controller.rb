class CarController < ApplicationController
  def index
    @cars = Car.all
  end

  def details
  end
end
