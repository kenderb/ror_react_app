class BooksCourse < ApplicationRecord
  belongs_to :book, class_name: :Book
  belongs_to :course, class_name: :Course
end
