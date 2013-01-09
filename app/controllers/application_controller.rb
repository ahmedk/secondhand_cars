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
  end
end
