# frozen_string_literal: true

module Api
  module V1
    class CoursesController < ApplicationController
      def index
        @courses = Course.all.includes(:books, :users).order(created_at: :desc)
      end
    end
  end
end
