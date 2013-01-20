class CarController < ApplicationController
  def index
    @cars = Car.list_cars(params)
  end

  def details
    id = params[:id]
    if id.nil?
      flash[:error] = "Missing data"
      redirect_to(:action => :index)
    end
    @car = Car.view(id)
    if(@car.nil?)
      flash[:error] = "No such car"
      redirect_to :action => :index
    end
  end

  def new
    @makes = Make.all
    @car = Car.new
    @car.owner = Owner.new unless signed_in?
    @car.owner_id = current_user.owner_id if signed_in?
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
    if !@car.editable_by(current_user)
      flash[:error] = "Don't have access to car"
      redirect_to :action => :index
    end

    @makes = Make.all
    @car_models = CarModel.where(:make_id => @car.make)
  end

  def create
    @car = Car.new(params[:car])
    if(!signed_in?)
      owner = Owner.new(params[:owner])
      owner.user = User.new(params[:user])
      @car.owner = owner
    end
    create_or_update
    render 'new' if !@car.valid?
  end

  def update
    id = params[:car][:id]
    @car = Car.find(id)
    @car.assign_attributes(params[:car])
    create_or_update
    render 'edit' if !@car.valid?
  end

private
  def create_or_update
    @car.doors = nil if @car.doors.blank?
    @car.seats = nil if @car.seats.blank?
    if @car.valid?
      @car.save
      flash[:success] = "Cas saved successfully"
      redirect_to :action => :details, :id => @car
    end
    @makes = Make.all
    @car_models = CarModel.where(:make_id => @car.make)
  end
end
