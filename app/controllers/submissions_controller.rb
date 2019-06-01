class SubmissionsController < ApplicationController
    before_action :set_assignment
    
    def index
    end 

    def show
    end

    def new
        @submission = Submission.new
    end

    def create 
        @submission = Submission.create(params[:content])
        @user = @course.user 
        @user.completed_assignments << @submission 
        flash[:message] = "#{@assignment.title} submitted!"
        redirect_to assignment_path(@assignment)
    end 

    def edit
    end

    def update
    end

    def destroy
    end 

    private 

    def set_assignment
        @assignment = Assignment.find_by(id: params[:id])
    end 
  
end
