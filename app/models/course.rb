class Course < ActiveRecord::Base
  validates :name, presence: true
  validates :number, presence: true, uniqueness: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
