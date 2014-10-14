class AssignmentsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :authorize_user, only: [:new,
                                        :create,
                                        :edit,
                                        :update,
                                        :destroy]

  def index
    @assignments = Assignment.all
  end

  def show
    @assignment = Assignment.find(params[:id])
    @submission = Submission.find_by(user: current_user,
                                  assignment: @assignment)
    if !@submission
      @submission = Submission.new
    end
  end

  def new
    @course = Course.find(params[:course_id])
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)

    if @assignment.save
      redirect_to course_assignment_path(@assignment.course, @assignment)
    else
      render "new"
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
    @course = @assignment.course
  end

  def update
    @assignment = Assignment.find(params[:id])
    @course = @assignment.course
    @assignment.update(assignment_params)
    redirect_to course_assignment_path(@assignment.course, @assignment),
                notice: "Course sucessfully updated."
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @course = @assignment.course
    @assignment.destroy
    redirect_to course_path(@course), notice: "Assignment sucessfully deleted."
  end

  private

  def assignment_params
    params.require(:assignment).permit(:title,
                                       :body,
                                       :"due_date(2i)",
                                       :"due_date(3i)",
                                       :"due_date(1i)"
                                       ).merge(course_id: params[:course_id])
  end
end
