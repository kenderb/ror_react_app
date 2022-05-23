# frozen_string_literal: true

require 'faker'
require './lib/db_filler'

desc 'Create 1 Course that contains 1 Book, 1 Instructor, and 15 Students'
task populate_db: :environment do
  filler = DbFiller.new
  filler.fill_data_base
end
