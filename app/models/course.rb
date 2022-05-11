class Course < ApplicationRecord
  validates :name, presence: true

  has_many :students, class_name: :User, foreign_key: :course_id
end
