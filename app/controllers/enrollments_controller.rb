class EnrollmentsController < ApplicationController
  def create
    @enrollment = Enrollment.new(user_id: current_user.id,
                                 course_id: params[:course_id])
    @enrollment.save
    redirect_to course_path(params[:course_id])
  end
end
