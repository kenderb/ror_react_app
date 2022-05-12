json.array! @users do |user|
  json.id user.id
  json.email user.email
  json.name user.name
  json.role user.role
  json.updated_at user.updated_at.localtime.strftime('%m/%d/%Y at %I:%M%p')
  json.course user.course.name

  json.reading_times do
    json.array! user.reading_times do |reading_time|
      json.title reading_time.book.title
      json.amount reading_time.amount
    end
  end
end
