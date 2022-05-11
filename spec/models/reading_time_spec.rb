require 'rails_helper'

RSpec.describe ReadingTime, type: :model do
  let(:reading_time) { create(:reading_time) }

  it 'should create with a default amount of 0' do
    expect(reading_time.amount).to eq(0)
  end

  describe 'associations' do
  end
end
