class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end 

    def show
        @course = Course.find_by(params[:id])
    end

    def new
        @course = Course.new
    end

    def create 
        @course = Course.find_by(params[:id])
        if @course.save
            redirect_to course_path(@course)
        else 
            render :new 
        end 
    end 

    def update
        @course = Course.find_by(params[:id])
            if @course.user = current_user
                render :edit 
            else 
                flash[:notice] = "You do not have access to this page!"
                redirect_to course_path(@course)
            end 
    end

    def destroy
    end 
end 
