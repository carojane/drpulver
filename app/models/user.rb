class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :students, dependent: :destroy
  accepts_nested_attributes_for :students
  has_many :ribbits, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :submissions, dependent: :destroy

  before_save :create_avatar_url
  before_validation :prep_email

  validates :username, presence: true,
                       uniqueness: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[\w.+-]+@([\w]+.)+\w+\z/ }
  after_save :build_student

  def admin?
    role == "admin"
  end

  private

  def prep_email
    email = self.email.strip.downcase if self.email
  end

  def create_avatar_url
    self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=100&d=mm"
  end

  def build_student
    @student = Student.create(user: self)
    @student.save
  end
end
