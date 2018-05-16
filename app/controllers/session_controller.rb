class SessionController < ApplicationController
  # skip_before_action :require_login, only: [:login, :create]
  def login
  end
  def create
    user = User.find_by name: params[:session][:name].downcase
    if user && user.authenticate(params[:session][:password])
      #TODO save user infor into session
      flash[:success] = "Login success"
      log_in user
      redirect_to user
    else
      flash[:danger] = "Invalid email/password combination"
      render :login
    end
  end
  def destroy
    log_out
    flash[:success] = "You are logged out"
    redirect_to login_path
  end
end
