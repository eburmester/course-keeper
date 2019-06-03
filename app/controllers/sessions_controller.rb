class SessionsController < ApplicationController
  helper_method :current_user, :logged_in?, :current_course


  def new 
    if logged_in?
      redirect_to user_path(current_user)
    end
  end 

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
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

  def facebook_login
    @user = User.find_by(uid: auth['uid']) 
    
      if @user.nil?
        @user = User.new(
          name: auth[:info][:name],
          email: auth[:info][:email],
          image: auth[:info][:image],
          password: SecureRandom.urlsafe_base64
          )
      end 
      
      if @user.save!
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else  
        render :new
    end 
  end 

  private 
  def auth
    request.env['omniauth.auth']
  end

end 