class SessionsController < ApplicationController

  def new 
    @user = User.new
  end 

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Login is incorrect"
      redirect_to :login
    end
  end

  def destroy
    if logged_in?
      session.clear
      redirect_to '/'
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
end 