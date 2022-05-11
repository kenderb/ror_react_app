require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:users).class_name('User') }
  end
end
