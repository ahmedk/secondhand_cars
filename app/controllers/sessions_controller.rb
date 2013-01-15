class SessionsController < ApplicationController
  def create
    owner = Owner.find_by_email(parmas[:email])
    if(owner && owner.user.authenticate(params[:password]))
      owner.user.name = owner.name
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
