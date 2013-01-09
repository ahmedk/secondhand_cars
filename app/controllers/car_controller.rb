class CarController < ApplicationController
  def index
    @cars = Car.all
    if(!params[:car_model].nil? && params[:car_model] != "")
      @cars = @cars.select { |c| c.car_model.name == params[:car_model] }
    elsif(!params[:make].nil? && params[:make] != "")
      @cars = @cars.select { |c| c.car_model.make.name == params[:make] }
    end
    @cars = @cars.select { |c| c.year.to_s == params[:date][:year] } unless params[:date].nil? || params[:date][:year] == ""
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

  def new
    @makes = Make.all
    @car = Car.new
    @car.owner = Owner.new
  end

  def edit
    id = params[:id]
    if id.nil?
      flash[:error] = "Missing data"
      redirect_to :action => :index
    end

    @car = Car.find(id) if @car.nil?
    if @car.nil?
      flash[:error] = "No such car"
      redirect_to :action => :index
    end

    @makes = Make.all
    @car_models = CarModel.where(:make_id => @car.make)
  end

  def create
    @car = Car.new(params[:car])
    owner = Owner.new(params[:owner])
    @car.owner = owner
    create_or_update
  end

  def update
    id = params[:car][:id]
    @car = Car.find(id)
    @car.assign_attributes(params[:car])
    create_or_update
  end

private
  def create_or_update
    @car.year = params[:date][:year] unless params[:date].nil?
    @car.doors = nil if @car.doors.blank?
    @car.seats = nil if @car.seats.blank?
    if @car.valid?
      @car.save
      redirect_to :action => :details, :id => id
    end
  end
end
