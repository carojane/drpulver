module ApplicationHelper
  def current_student
    Student.find_by(user_id: current_user.id)
  end
end
