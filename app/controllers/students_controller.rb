class StudentsController < ApplicationController
  def index
    @students = User.all
  end
  def show
    @student = User.find(params[:id])
    @ribbit = Ribbit.new
  end
end