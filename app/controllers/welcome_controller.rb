class WelcomeController < ApplicationController
  def index
    @courses = Course.order(:number)
  end
end
