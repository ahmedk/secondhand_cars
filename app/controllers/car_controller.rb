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
    @makes = [Make.new(:name => "-- Select Make --", :id => -1), Make.all].flatten
    @car = Car.new
  end

  def edit
    id = params[:id]
    if id.nil?
      flash[:error] = "Missing data"
      redirect_to :action => :index
    end

    @car = Car.find(id)
    if @car.nil?
      flash[:error] = "No such car"
      redirect_to :action => :index
    end

    @makes = Make.all
    @car_models = CarModel.where(:make_id => @car.make)
  end

  def create_or_update
    id = params[:id]  # for use with login later
		params.delete(:id)
		params.delete(:make_id)
		params.delete(:controller)
		params.delete(:action)
		params[:year] = params[:date][:year] unless params[:date].nil?
		params.delete(:date)
		@car = Car.new(params)
		@car.id = id
		puts "bllllaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa #{@car.valid?}"
		puts @car.description
		if !@car.valid?
			render 'new' if id.nil?
			render 'edit' unless id.nil?
		else
			@car.save
			redirect_to :action => :details, :id => @car
		end
  end
end
