# frozen_string_literal: true

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

    it 'should create students that have a ReadingTime associated to a Book' do
      expect(Book.all.size).to eq 1
      expect(ReadingTime.all.size).to_not be 0

      User.student.each do |student|
        expect(student.reading_times.last.amount).to be > 0
        expect(student.reading_times.last.book_id).to eq Book.last.id
      end
    end
  end
end
