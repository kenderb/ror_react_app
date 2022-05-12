class Api::V1::CoursesController < ApplicationController
  def index
    @courses = Course.all.includes(:books, :users).order(created_at: :desc)
  end
end
