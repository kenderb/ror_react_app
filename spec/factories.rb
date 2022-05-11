require 'faker'

FactoryGirl.define do
  factory :reading_time do
  end

  factory :book do
    title Faker::Book.unique.title
    content Faker::Lorem.paragraph
  end

  factory :course do
    name Faker::Book.unique.title
  end

  factory :user do |f|
    f.name Faker::Name.name
    f.email Faker::Internet.unique.email
  end
end
