class Student < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true, uniqueness: true

  def full_name
    first = self.first_name
    last = self.last_name
    if first && last
      first + " " + last
    elsif first
      first
    elsif last
      last
    else
    end
  end

  def birthday
    self.date_of_birth.strftime("%B %-d, %Y")
  end
end
