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

  def create_or_update
    id = params[:car][:id]  # for use with login later
    if(id.blank?)
      @car = Car.new(params[:car])
      owner = Owner.new(params[:owner])
      @car.owner = owner
    else
      @car = Car.find(id)
      @car.assign_attributes(params[:car])
    end
    @car.year = params[:date][:year] unless params[:date].nil?
    @car.doors = nil if @car.doors.blank?
    @car.seats = nil if @car.seats.blank?
    if !@car.valid?
      puts @car.errors.full_messages
      redirect_to car_edit_path(id) unless id.blank?
      redirect_to :action => :new if id.blank?
    else
      @car.save
      redirect_to :action => :details, :id => id
    end
  end
end
