class AddInstructorIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :instructor_id, :integer
  end
end
