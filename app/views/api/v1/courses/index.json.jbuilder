json.array! @courses do |course|
  json.id course.id
  json.name course.name
  json.created_at course.created_at

  json.books do
    json.array! course.books do |book|
      json.id book.id
      json.title book.title
    end
  end

  json.users do
    json.array! course.users do |user|
      json.id user.id
      json.email user.email
      json.role user.role
    end
  end
end
