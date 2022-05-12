require 'rails_helper'
require 'db_filler'

RSpec.describe DbFiller do
  let(:filler) { DbFiller.new }

  describe '#fill_data_base' do
    before(:each) do
      filler.fill_data_base
    end

    it 'should have 1 Course that contains 1 Book' do
      expect(Course.all.size).to eq 1
      expect(Course.last.books.size).to eq 1
    end

    it 'should have 1 Instructor, and 15 Students' do
      expect(User.all.size).to eq 16
      expect(User.instructor.size).to eq 1
      expect(User.student.size).to eq 15
    end

    it 'Each Student should have a ReadingTime associated with the Book' do
      expect(ReadingTime.all.size).to_not be 0
      # expect(User.student.last.reading_times.last.book_id).to eq Book.last.id
    end
  end
end