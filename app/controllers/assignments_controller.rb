class AssignmentsController < ApplicationController
  def index
  end

  def show
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
