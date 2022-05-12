json.array! @courses do |course|
  json.id course.id
  json.name course.name
  json.created_at course.created_at

  json.books course.books.size
  json.students course.students.size
  json.instructors course.instructors.size
end
