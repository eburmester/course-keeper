class UsersController < ApplicationController
    helper_method :logged_in?, :current_user
    
    def index
        @user = current_user
    end 

    def show
        @user = current_user
        if logged_in?
          if @user == User.find_by(id: params[:id])
            redirect_to user_profile_path(@user)
          else 
            render :new
          end
        end 
    end

    


    

    private 

    def user_params 
        params(:user).permit(:name, :email, :password, :password_confirmation)
    end 
end
