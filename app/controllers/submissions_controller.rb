class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: :index

  def index
    @assignment  = Assignment.find(params[:assignment_id])
    @submissions = Submission.where(assignment: @assignment)
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      redirect_to course_assignment_path(@submission.assignment.course,
                                         @submission.assignment),
                  notice: "Assignment submission complete!"
    else
      redirect_to course_assignment_path(@submission.assignment.course,
                                         @submission.assignment),
                  notice: "Attention: " + @submission.errors.full_messages.join("\n")
    end
  end

  def edit
    @submission = Submission.find(params[:id])
    @assignment = @submission.assignment
  end

  def update
    @submission = Submission.find(params[:id])
    @submission.update(submission_params)
    redirect_to course_assignment_path(@submission.assignment.course,
                                       @submission.assignment),
                notice: "Submission updated!"
  end

  private

  def submission_params
    params.require(:submission).
      permit(:body).merge(user_id: current_user.id,
                          assignment_id: params[:assignment_id])
  end
end
