class CoursesController < ApplicationController
    require 'date'
    
    def index
        @courses = Course.all
        @user = current_user
    end 

    def show
        @course = Course.find_by(id: params[:id])
        @user = current_user
        @assignment = Assignment.find_by(id: params[:id])
    end

    def new
        @course = Course.new
    end 

    def create 
        @user = current_user
        @course = Course.new(course_params)
        @course.created_by = current_user
        @course.created_on = Date.today
        if @course.save
            flash[:message] = "#{@course.title} has been created"
            redirect_to course_path(@course)
        else 
            render :new 
        end 
    end 
    
    def edit 
        @course = Course.find_by(params[:id])
    end


    def update
        @course = Course.find_by(params[:id])
        @user = current_user
            if @course.save!
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
        params.require(:course).permit(:id, :title, :description, :created_by, :created_at)
    end
end 
