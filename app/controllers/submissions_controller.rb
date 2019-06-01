class SubmissionsController < ApplicationController
    before_action :set_assignment
    before_action :created_by_current_user, only: [:edit, :update]
    helper_method :current_assignment

    def index
    end 

    def show
    end

    def new
        @submission = Submission.new
    end

    def create 
        @assignment = current_assignment
        @user = current_user
        @submission = @user.submissions.build(submission_params)

        if @submission.save!
            flash[:message] = "#{@assignment.title} submitted!"
            redirect_to assignment_submissions_path(current_user)
        else
            flash[:message] = "There was a problem with your submission!"
            redirect_to assignment_path(current_assignment) 
        end
    end 

    def edit
    end

    def update
    end

    def destroy
    end 

    private 

    def submission_params
        params.require(:submission).permit(:content, :user_id, :assignment_id)
    end

    def set_assignment
        @assignment = Assignment.find_by(id: params[:id])
    end 

    def current_assignment
        @assignment = Assignment.find_by(id: params[:id])
      end

    def created_by_current_user
        unless @submission.user_id == current_user.id
          flash[:danger] = "You cannot edit this submission because you did not create it!"
          redirect_to assignment_path(@assignment)
        end
      end
  
end
