# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  let(:first_course) { create(:course) }
  let(:last_course) {  create(:course) }
  let(:book) { create(:book) }
  let(:student) { create(:user, course: last_course, email: "my@email") }
  let(:instructor) { create(:user, course: last_course, role: :instructor) }

  context 'Courses#index' do
    before(:each) do
      first_course
      last_course
      book.courses << last_course
      book.save!
      student
      instructor
    end

    it 'should get a list of courses' do
      headers = { 'ACCEPT' => 'application/json' }
      get api_v1_courses_index_path, params: {}, headers: headers

      json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(json.size).to eq 2
      expect(json.first['students']).to eq 1
      expect(json.first['books']).to eq 1
      expect(json.first['instructors']).to eq 1
    end
  end
end
