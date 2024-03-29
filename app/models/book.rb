# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  has_many :reading_times, class_name: :ReadingTime
  has_many :students, through: :reading_times, class_name: :User

  has_many :books_courses, class_name: :BooksCourse
  has_many :courses, through: :books_courses
end
