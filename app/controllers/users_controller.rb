class UsersController < ApplicationController
 # skip_before_action :require_login, only: [:new, :create]
  def index
    @users = User.all
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @_user = User.find_by! name: @user.name
    if(@_user.present?)
      flash[:danger] = "Register failed"
      redirect_to new_user_path
      return
    end
    if(@user.save)
      flash[:success] = "Register success"
      redirect_to login_path
    else
      flash[:danger] = "Register failed"
      render :new
    end
  end

  def delete_user_with_user_name
    if(User.find(params[:id]).destroy)
      flash[:success] = "Delete success"
      redirect_to users_path
    else
      flash[:danger] = "Delete failed"
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :password , :password_confirmation
  end
end