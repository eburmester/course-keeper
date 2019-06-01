class CoursesController < ApplicationController
    require 'date'
    before_action :require_login
    before_action :set_user
    before_action :set_user_course, only: [:show, :edit, :update, :destroy]
    helper_method :current_user, :logged_in?, :current_course

    def index
        @courses = current_user.courses
    end 

    def show
        @course = Course.find_by(id: params[:id])
        @assignment = Assignment.find_by(id: params[:id])
    end

    def new
        @course = Course.new
    end 

    def create 
        @user = current_user
        @course = @user.courses.build(course_params)
        @course.created_on = Date.today
        if @course.save
            flash[:message] = "#{@course.title} has been created"
            redirect_to course_path(@course)
        else 
            render :new 
        end 
    end 
    
    def edit 
        @course = Course.find_by(id: params[:id])
    end


    def update
        @course = Course.find_by(id: params[:id])
            if @course.update(course_params)
                redirect_to course_path(@course)
                flash[:message] = "#{@course.title} updated!"
            else 
                redirect_to edit_course_path(@course)
        end 
    end

    def destroy
    end 

    private

    def course_params
        params.require(:course).permit(:id, :title, :description, :user_id, :created_by, :created_at)
    end

    def set_user
        @user = User.find_by(id: params[:user_id])
      end

      def set_user_course
        @course = Course.find_by(id: params[:id])
        unless @course.user == current_user
          flash[:danger] = "This is not your course!"
          redirect_to course_path
        end
      end
end 
