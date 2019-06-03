class CoursesController < ApplicationController
    require 'date'
    before_action :require_login
    before_action :set_user
    before_action :set_user_course, only: [:edit, :update, :destroy]
    helper_method :current_user, :logged_in?, :current_course

    def index
        @courses = Course.all
        @assignments = Assignment.find_by(id: params[:course_id])
    end 

    def show
        @course = Course.find_by(id: params[:id])
        @assignment = Assignment.find_by(id: params[:id])
        @user = current_user
    end

    def new
        @course = Course.new
    end 

    def create 
        @user = current_user
        @course = @user.courses.build(course_params)
        @course.created_on = Date.today
        if @course.save!
            flash[:message] = "#{@course.title} has been created"
            redirect_to user_course_path(@user, @course)
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
            redirect_to user_course_path(@course)
            flash[:message] = "#{@course.title} updated!"
        else 
            redirect_to edit_user_course_path(@course)
        end 
    end

    def destroy
        if @course
            @course.destroy
            @course.assignments.destroy
            redirect_to user_courses_path
            flash[:message] = "Your course has been deleted"
        else
            render :show
            flash[:danger] = "This course could not be deleted"
        end
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
