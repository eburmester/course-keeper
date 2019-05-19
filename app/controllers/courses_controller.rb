class CoursesController < ApplicationController
    require 'date'
    
    def index
        @courses = Course.all
    end 

    def show
        @course = Course.find_by(params[:id])
    end

    def new 
        @course = Course.new(course_params)
        @course.created_by = current_user
        @course.created_on = Date.today
        if @course.save
            redirect_to user_course_path(@course)
        else 
            render :new 
        end 
    end 

    def update
        @course = Course.find_by(params[:id])
            if @course.created_by == current_user
                redirect_to edit_course_path(@course)
            else 
                flash[:notice] = "You do not have access to this page!"
                redirect_to course_path(@course)
        end 
    end

    def destroy
    end 

    private

    def course_params
        params.require(:course).permit(:title, :description)
end 
