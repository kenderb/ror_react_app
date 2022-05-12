# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:first_course) { create(:course) }
  let(:last_course) {  create(:course) }
  let(:book) { create(:book) }
  let(:student) { create(:user, course: last_course, email: 'my@email') }
  let(:instructor) { create(:user, course: last_course, role: :instructor) }

  context 'Users#index' do
    before(:each) do
      first_course
      last_course
      book.courses << last_course
      book.save!
      student
      instructor
    end

    it 'should get a list of users' do
      headers = { 'ACCEPT' => 'application/json' }
      get api_v1_users_index_path, params: {}, headers: headers

      json = JSON.parse(response.body)
      expect(json.size).to eq 2
      expect(response.status).to eq 200
      expect(json.last['role']).to eq 'student'
      expect(json.last['course']).to eq last_course.name
      expect(json.first['role']).to eq 'instructor'
    end
  end

  context 'Users#update' do
    before(:each) do
      first_course
      last_course
      book.courses << last_course
      book.save!
      student
      instructor
    end

    it 'should edit a user name using the email' do
      headers = { 'ACCEPT' => 'application/json' }
      patch api_v1_users_path, params: { email: student.email, name: 'Name edited' }, headers: headers

      json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(json['email']).to eq student.email
      expect(json['name']).to eq 'Name edited'
    end

    it 'should not edit a user name if param name is empty' do
      headers = { 'ACCEPT' => 'application/json' }
      patch api_v1_users_path, params: { email: student.email, name: '' }, headers: headers

      json = JSON.parse(response.body)
      expect(response.status).to eq 422
      expect(json['message']).to eq "Name can't by empty."
    end
  end
end
