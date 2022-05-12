json.array! @users do |user|
  json.id user.id
  json.email user.email
  json.name user.name
  json.role user.role
  json.course user.course.name
end
