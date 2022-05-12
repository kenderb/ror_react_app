json.array! @courses do |course|
  json.id course.id
  json.name course.name
  json.created_at course.created_at.localtime.strftime('%m/%d/%Y at %I:%M%p')

  json.books course.books.size
  json.students course.students.size
  json.instructors course.instructors.size
end
