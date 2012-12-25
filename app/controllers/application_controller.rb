class ApplicationController < ActionController::Base
  protect_from_forgery
  def get_models
    render :json => Make.find_by_name(params[:make_name]).car_model.to_json
  end
end
