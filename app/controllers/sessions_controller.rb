class SessionsController < ApplicationController
  
  def new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if !@user.nil?
      log_in_user!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = ["Email and/or password were incorrect."]
      render :new
    end
  end
  
  def destroy
    log_out_user!
    redirect_to new_session_url
  end
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
  
end
