class CoursesController < ApplicationController
  def index
    @courses = Course.order(:number)
  end

  def show
    @course = Course.find(params[:id])
    @assignments = Assignment.where(course: @course)
    @enrollments = Enrollment.where(course: @course)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to course_path(@course)
    else
      render "new"
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    redirect_to course_path(@course),
                notice: "Course sucessfully updated."
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path,
                notice: "Course sucessfully deleted"
  end

  private

  def course_params
    params.require(:course).permit(:name,
                                   :number,
                                   :meeting_time,
                                   :description,
                                   :syllabus,
                                   :"start_date(2i)",
                                   :"start_date(3i)",
                                   :"start_date(1i)",
                                   :"end_date(2i)",
                                   :"end_date(3i)",
                                   :"end_date(1i)"
                                   )
  end
end
