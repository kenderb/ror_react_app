require 'faker'
require './lib/db_populator'

desc 'Create 1 Course that contains 1 Book, 1 Instructor, and 15 Students'
task populate_db: :environment do
  populator = DbPopulator.new
  populator.populate
end
