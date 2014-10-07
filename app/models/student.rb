class Student < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true, uniqueness: true

  def full_name
    if first_name && last_name
      first_name + " " + last_name
    elsif first_name
      first_name
    elsif last_name
      last_name
    else
    end
  end

  def birthday
    date_of_birth.strftime("%B %-d, %Y")
  end
end
