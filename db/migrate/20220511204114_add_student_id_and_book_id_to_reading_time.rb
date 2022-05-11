class AddStudentIdAndBookIdToReadingTime < ActiveRecord::Migration[5.2]
  def change
    add_column :reading_times, :student_id, :integer
    add_column :reading_times, :book_id, :integer
  end
end
