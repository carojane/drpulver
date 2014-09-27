class RibbitsController < ApplicationController
  def index
    @ribbits = Ribbit.all
    @ribbit = Ribbit.new
  end

  def create
    @ribbit = Ribbit.new(ribbit_params)
    if @ribbit.save
      redirect_to student_path(current_user)
    else
      flash[:error] = "Problem!"
      redirect_to student_path(current_user)
    end
  end

  private

  def ribbit_params
    params.require(:ribbit).permit(
      :content
      ).merge(user: current_user)
  end
end
