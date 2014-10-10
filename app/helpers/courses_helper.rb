module CoursesHelper
  def enrolled(course)
    Enrollment.find_by(user_id: current_user.id, course_id: course.id)
  end
end
