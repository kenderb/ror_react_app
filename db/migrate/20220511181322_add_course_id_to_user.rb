class AddCourseIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :course_id, :integer
  end
end
