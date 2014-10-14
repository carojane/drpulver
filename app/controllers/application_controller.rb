class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username,
                                                 :name,
                                                 :avatar_url,
                                                 students_attributes: [:date_of_birth,
                                                                       :bio,
                                                                       :user_id]]
  end

  def after_sign_in_path_for(_resource)
    student_path(current_user)
  end

  def authorize_user
    unless user_signed_in? and current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
