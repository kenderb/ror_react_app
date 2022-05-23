# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReadingTime, type: :model do
  let(:course) { create(:course) }
  let(:book) { create(:book) }
  let(:student) { create(:user, course: course) }
  let(:reading_time) { create(:reading_time, student: student, book: book) }

  it 'should create with a default amount of 0' do
    expect(reading_time.amount).to eq(0)
  end

  describe 'associations' do
    it { should belong_to(:student).class_name('User') }
    it { should belong_to(:book).class_name('Book') }
  end
end
