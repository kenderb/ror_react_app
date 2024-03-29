# frozen_string_literal: true

class RenameBookNameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :name, :title
  end
end
