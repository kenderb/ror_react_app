require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should define_enum_for(:role).with(%i[student instructor]) }
  end

  describe 'associations' do
    it { should belong_to(:instructor).class_name('User').optional }
    it { should have_many(:students).class_name('User') }
  end
end
