# frozen_string_literal: true

class DbFiller
  attr_accessor :course, :book

  def initialize
    @course = Course.create!(name: Faker::Book.unique.title)
    @book = Book.create!(title: Faker::Book.unique.title, content: Faker::Lorem.paragraph)
  end

  def fill_data_base
    add_book_to_course
    assign_instructor_to_students
  end

  private

  def assign_instructor_to_students
    instructor = create_instructor_with_course
    15.times { instructor.students << create_student_with_course }

    instructor.save!
  end

  def create_user_with_course
    User.create!(name: Faker::Name.name, email: Faker::Internet.unique.email, course: course)
  end

  def save_user(user)
    user.save!
    user
  end

  def create_instructor_with_course
    current_user = create_user_with_course
    current_user.instructor!

    save_user(current_user)
  end

  def add_reading_times_to_student(student)
    student.books << book
    student.reading_times.last.update!(amount: rand(1..100))

    student
  end

  def create_student_with_course
    current_user = create_user_with_course
    current_user.student!
    current_user = add_reading_times_to_student(current_user)

    save_user(current_user)
  end

  def add_book_to_course
    course.books << book
    course.save!
  end
end
