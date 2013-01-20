class SessionsController < ApplicationController
  def create
    owner = Owner.find_by_email(params[:email])
    if(owner && owner.user.authenticate(params[:password]))
      sign_in(owner.user)
      flash[:success] = "Login successful"
    else
      flash[:error] = "Wrong email or password"
    end
    redirect_to '/'
  end

  def destroy
    sign_out
    flash[:success] = "Logout successful"
    redirect_to '/'
  end
end
