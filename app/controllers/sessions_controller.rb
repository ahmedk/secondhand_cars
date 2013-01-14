class SessionsController < ApplicationController
  def create
    owner = Owner.find(:email => parmas[:email])
    if(owner && owner.user.authenticate(params[:password]))
      sign_in(owner.user)
      flash[:notice] = "Login successful"
    else
      flash[:error] = "Wrong email or password"
    end
    redirect_to '/'
  end

  def destroy
    sign_out
    redirect_to '/'
  end
end
