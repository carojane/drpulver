class EnrollmentsController < ApplicationController
  before_action :authorize_user, only: [:destroy]

  def create
    @enrollment = Enrollment.new(user_id: current_user.id,
                                 course_id: params[:course_id])
    @enrollment.save
    redirect_to course_path(params[:course_id])
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy
    redirect_to course_path(params[:course_id]),
                notice: "Student has been removed."
  end
end
