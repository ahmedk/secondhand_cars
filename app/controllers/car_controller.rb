class CarController < ApplicationController
  def index
    @cars = Car.all
    if(!params[:car_model].nil? && params[:car_model] != "")
      @cars = @cars.select { |c| c.car_model.name == params[:car_model] }
    elsif(!params[:make].nil? && params[:make] != "")
      @cars = @cars.select { |c| c.car_model.make.name == params[:make] }
    end
    puts "blllllllllllllllllllllaaaaaaaaaaaaaaaaaaaaaaa #{params[:date][:year]}"
    @cars = @cars.select { |c| c.year.to_s == params[:date][:year] } unless params[:date][:year].nil? || params[:date][:year] == ""
  end

  def details
    id = params[:id]
    if id.nil?
      flash[:error] = "Missing data"
      redirect_to(:action => :index)
    end
    @car = Car.find(id)
    if(@car.nil?)
      flash[:error] = "No such car"
      redirect_to :action => :index
    end
  end
end
