require 'rails_helper'

RSpec.describe BooksCourse, type: :model do
  describe 'associations' do
    it { should belong_to(:course).class_name('Course') }
    it { should belong_to(:book).class_name('Book') }
  end
end
