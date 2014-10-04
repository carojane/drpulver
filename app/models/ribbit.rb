class Ribbit < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  belongs_to :user

  validates :content,
            presence: true,
            length: { maximum: 140, minimum: 1 }
end
