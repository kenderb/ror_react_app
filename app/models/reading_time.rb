# frozen_string_literal: true

class ReadingTime < ApplicationRecord
  belongs_to :book, class_name: :Book
  belongs_to :student, class_name: :User
end
