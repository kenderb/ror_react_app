require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:course) { create(:course) }
  let(:user) { build(:user, course: course, email: 'Some random bad email') }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should define_enum_for(:role).with(%i[student instructor]) }

    it 'should not accept a invalid email format' do
      expect(user.valid?).to be false
    end
  end

  describe 'associations' do
    it { should belong_to(:instructor).class_name('User').optional }
    it { should belong_to(:course).class_name('Course') }
    it { should have_many(:students).class_name('User') }
    it { should have_many(:books).class_name('Book').through(:reading_times) }
  end
end
