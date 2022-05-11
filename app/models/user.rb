class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :students, class_name: :User, foreign_key: :instructor_id
  belongs_to :instructor, class_name: :User, optional: true
  belongs_to :course, class_name: :Course

  has_many :reading_times, class_name: :ReadingTime, foreign_key: :student_id
  has_many :books, through: :reading_times

  enum role: %i[student instructor]
end
