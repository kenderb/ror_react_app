class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :students, class_name: :User, foreign_key: :instructor_id
  belongs_to :instructor, class_name: :User, optional: true
  belongs_to :course, class_name: :Course

  enum role: %i[student instructor]
end
