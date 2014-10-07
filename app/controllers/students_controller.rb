class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @students = Student.all
  end

  def show
    @user = User.find(params[:id])
    @student = Student.find_by(user: @user)
    @ribbit = Ribbit.new
  end

  def edit
    @student = Student.find_by(user: current_user)
  end

  def update
    @student = Student.find_by(user: current_user)
    @student.update(student_params)
    redirect_to student_path(current_user)
  end

  private

  def student_params
    params.require(:student).permit(:first_name,
                                    :last_name,
                                    :"date_of_birth(2i)",
                                    :"date_of_birth(3i)",
                                    :"date_of_birth(1i)",
                                    :bio)
  end
end
