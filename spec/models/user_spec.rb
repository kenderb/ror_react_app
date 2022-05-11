require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'is valid with valid attributes' do
    expect(build(:user)).to be_valid
  end

  it 'is not valid without a title' do
    expect(User.new).to_not be_valid
  end

  it 'is not valid without a name' do
    expect(build(:user, name: nil, email: 'mail@mail.com')).to_not be_valid
  end

  it 'is not valid without a name' do
    expect(build(:user, name: 'name', email: nil)).to_not be_valid
  end
end
