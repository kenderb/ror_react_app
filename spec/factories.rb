FactoryGirl.define do
  factory :course do
    name 'Course name'
  end

  factory :user do |f|
    f.name 'Kender'
    f.email 'Kender@mail.com'
  end
end
