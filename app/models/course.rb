class Course < ApplicationRecord
  validates :name, presence: true

  has_many :users, class_name: :User, foreign_key: :course_id
  has_many :students, -> { student }, class_name: :User
  has_many :instructors, -> { instructor }, class_name: :User

  has_many :books_courses, class_name: :BooksCourse, foreign_key: :course_id
  has_many :books, through: :books_courses
end
