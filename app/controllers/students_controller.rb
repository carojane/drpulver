class StudentsController < ApplicationController
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
  end

  private
end
