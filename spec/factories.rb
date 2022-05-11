FactoryGirl.define do
  factory :reading_time do
  end

  factory :book do
    title 'book title'
    content 'some content here for the book'
  end

  factory :course do
    name 'Course name'
  end

  factory :user do |f|
    f.name 'Kender'
    f.email 'Kender@mail.com'
  end
end
