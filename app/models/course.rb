class Course < ActiveRecord::Base
  has_many :assignments, dependent: :destroy
  has_many :enrollments, dependent: :destroy

  validates :name, presence: true
  validates :number, presence: true, uniqueness: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
