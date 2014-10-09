class Assignment < ActiveRecord::Base
  belongs_to :course

  validates :body,     presence: true
  validates :title,    presence: true
  validates :due_date, presence: true
  validates :course,   presence: true
end
