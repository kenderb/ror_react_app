class Api::V1::CoursesController < ApplicationController
  def index
    @courses = Course.all.order(created_at: :desc)
    render json: @courses, status: :ok
  end
end
