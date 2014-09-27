class Student < ActiveRecord::Base
  belongs_to :user

  def student
    super || build_student
  end
end
