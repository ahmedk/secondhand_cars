class ApplicationController < ActionController::Base
  protect_from_forgery
  def get_models
    if(params[:make_name])
      render :json => Make.find_by_name(params[:make_name]).car_model.to_json
    elsif(params[:make_id])
      render :json => Make.find(params[:make_id]).car_model.to_json
    end
  end

  def index
    @latest = Car.find(:all, :conditions => { :sold => false }, :order => 'created_at DESC').limit(5)
    puts @latest
  end

  def search
    @cars = nil
    if request.method == "POST"
      @cars = Car.match(params[:search])
      flash[:notice] = "No cars matching criteria" if @cars.blank?
    end
  end
end
