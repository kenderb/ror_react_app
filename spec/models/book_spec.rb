# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:content) }
  end

  describe 'associations' do
    it { should have_many(:students).class_name('User').through(:reading_times) }
    it { should have_many(:courses).class_name('Course').through(:books_courses) }
  end
end
