class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ update]

  def update
    @user.update!(name: user_params[:name])
    render json: @user, status: :ok
  end

  private

  def set_user
    @user = User.where('email like ?', "%#{user_params[:email]}%").last
  end

  def user_params
    params.permit(:name, :email)
  end
end
