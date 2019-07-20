class AssignmentsController < ApplicationController
    before_action :require_login
    before_action :set_course, only: [:show, :edit, :update]
    before_action :created_by_current_user, only: [:edit, :update]
    
    def index
    if params[:course_id]
        @course = Course.find_by(id: params[:course_id])
        @assignments = @course && @course.assignments
      if @assignments
        respond_to do |t|
            t.html { }
            t.json { render json: @assignments, each_serializer: AssignmentSerializer }
        end 
    else
        @error = "Course not found"
        respond_to do |f|
          f.html {}
          f.json { render json: {message: @error}, status: :not_found }
        end
      end
    else
      @assignments = Assignment.all 
      respond_to do |f|
        f.html {}
        f.json { render json: @assignment }
      end
    end 
end

    def show
        @assignment = Assignment.find_by(id: params[:id])
        @course = Course.find_by(id: params[:course_id])
        @submissions = @assignment.submissions
        respond_to do |t|
            t.html { }
            t.json { render json: @assignment }
        end 
    end

    def new
        @assignment = Assignment.new 
        @assignment.course = Course.find_by(id: params[:course_id])
    end

    def create 
        @assignment = Assignment.new(assignment_params)
        @assignment.course = Course.find_by(id: params[:course_id])
   
        if @assignment.save
            flash[:message] = "#{@assignment.title} has been created"
            redirect_to course_assignment_path(@assignment.course_id, @assignment)
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
        params.require(:assignment).permit(:title, :difficulty, :course_id, :user_id)
    end 
   
    def set_course
        @course = Course.find_by(id: params[:id])
      end
    
      def created_by_current_user
        unless @course.created_by == current_user.id
          flash[:danger] = "You cannot edit this course because you did not create it!"
          redirect_to course_path(@course)
        end
      end
end

