class UsersController < ApplicationController
    helper_method :logged_in?, :current_user
    before_action :require_login, only: [:index, :show]
      def new 
        @user = User.new
      end 

      def create
        @user = User.new(user_params)
        if @user.save
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
    end

    private 

    def user_params 
        params.require(:user).permit(:name, :email, :password)
    end 
end
