class UsersController < ApplicationController
  before_action :require_login, only: [:index, :show]
  helper_method :current_user, :logged_in?, :current_course
      
    def new 
      if logged_in?
        redirect_to user_path(current_user)
      else
        @user = User.new
      end
    end 

    def create
      @user = User.new(user_params)
      if @user.save!
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render new_user_path
      end
    end

    def index
        @user = User.find_by(id: params[:id])
    end 

    def show
      if logged_in?
        if @user == User.find_by(id: params[:id])
          @user = current_user
        else
          flash[:danger] = "You don't have access to view that user's settings!"
          redirect_to root_path
        end
      else
        redirect_to login_path
      end
    end

    private 

    def user_params 
        params.require(:user).permit(:name, :email, :password)
    end 
end
