class UsersController < ApplicationController
    helper_method :logged_in?, :current_user
    
    def index
        @user = current_user
        if logged_in?
          redirect_to user_path(current_user)
        else
          redirect_to new_user_path
        end
      end
    
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
        @user = current_user
    end 

    def show
        @user = current_user
        if logged_in?
          if @user == User.find_by(id: params[:id])
            redirect_to user_path(@user)
          else 
            render :new
          end
        end 
    end

    private 

    def user_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end 
end
