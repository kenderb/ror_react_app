# frozen_string_literal: true

class Course < ApplicationRecord
  validates :name, presence: true

  has_many :users, class_name: :User
  has_many :students, -> { student }, class_name: :User
  has_many :instructors, -> { instructor }, class_name: :User

  has_many :books_courses, class_name: :BooksCourse
  has_many :books, through: :books_courses
end
