# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:users).class_name('User') }
    it { should have_many(:books).class_name('Book').through(:books_courses) }
    it { should have_many(:instructors).class_name('User') }
    it { should have_many(:students).class_name('User') }
  end
end
