# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[update]

      def index
        @users = User.all.includes(:books).order(updated_at: :desc)
      end

      def update
        if user_params[:name].empty?
          return render json: { message: "Name can't by empty." },
                        status: :unprocessable_entity
        end

        @user.update!(name: user_params[:name])
        render json: @user, status: :ok
      end

      private

      def set_user
        @user = User.find_by(email: user_params[:email])
      end

      def user_params
        params.permit(:name, :email)
      end
    end
  end
end
