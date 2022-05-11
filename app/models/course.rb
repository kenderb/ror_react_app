class Course < ApplicationRecord
  validates :name, presence: true

  has_many :users, class_name: :User, foreign_key: :course_id
end
