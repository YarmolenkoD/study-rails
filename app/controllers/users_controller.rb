class UsersController < ApplicationController
  def show
    @user = User.find_by(id: user_params[:id])
    p @user
  end

  def search
    # @users = User.where(first_name: user_params[:first_name]).all
    # @users = User.all
    # @users = User.where("first_name like ? or last_name like ?", "%#{user_params[:search]}%", "%#{user_params[:search]}%").all
    @users = User.search(user_params[:search])
  end

  private

  def user_params
    params.permit(:id, :search)
  end
end
