class SessionsController < ApplicationController

  def new 
    @user = User.new
  end 

  def create
    @user = User.find_by(user_params)
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Login is incorrect"
      redirect_to :login
    end
  end
  
  private 

  def user_params 
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
end 