# frozen_string_literal: true

class CreateReadingTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :reading_times do |t|
      t.integer :amount, default: 0

      t.timestamps
    end
  end
end
