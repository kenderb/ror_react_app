class Course < ApplicationRecord
  validates :name, presence: true

  has_many :users, class_name: :User, foreign_key: :course_id
  has_many :students, -> { where(role: :students) }, class_name: :User
  has_many :instructors, -> { where(role: :instructor) }, class_name: :User
end
