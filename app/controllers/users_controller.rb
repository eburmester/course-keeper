class UsersController < ApplicationController
    helper_method :logged_in?, :current_user
    
    def index
    end 

    def show
        @user = current_user
        if logged_in?
          if @user == User.find_by(id: params[:id])
            render :layout => "profile"
          else 
            render :new
          end
        end 
    end

    def new
        if logged_in?
            redirect_to user_profile_path(current_user)
        else 
            @user = User.new 
        end 
    end

    def create 
        @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                redirect_to user_profile_path(@user)
            else
                render :new
            end
    end


    

    private 

    def user_params 
        params(:user).permit(:name, :email, :password, :password_confirmation)
    end 
end
