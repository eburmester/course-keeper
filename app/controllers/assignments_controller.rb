class AssignmentsController < ApplicationController
    def index
        @assignments = Assignment.all
        @course = current_course
    end 

    def show
        @assignment = Assignment.find_by(id: params[:id])
        @course = current_course
    end

    def new
        @assignment = Assignment.new 
    end

    def create 
        
        @assignment = Assignment.create(assignment_params)
        @assignment.course = current_course
        if @assignment.save!
            flash[:message] = "#{@assignment.title} has been created"
            redirect_to assignment_path(@assignment)
        else 
            render :new 
        end
    end 

    def edit
        @assignment = Assignment.find_by(id: params[:id])
    end

    def update
    end

    def destroy
    end 

    private 

    def assignment_params
        params.require(:assignment).permit(:title, :difficulty, :course_id)
    end 
   
end

