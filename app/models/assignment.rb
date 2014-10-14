class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :submissions, dependent: :destroy
  default_scope { order("due_date") }

  validates :body,     presence: true
  validates :title,    presence: true
  validates :due_date, presence: true
  validates :course,   presence: true
end
