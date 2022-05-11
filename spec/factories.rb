FactoryGirl.define do
  factory :book do
    name 'book name'
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
