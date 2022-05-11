class CreateBooksCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :books_courses do |t|
      t.integer :book_id, index: true
      t.integer :course_id, index: true
    end
  end
end
