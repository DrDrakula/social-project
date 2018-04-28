class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      token = issue_token({ 'user_id': @user.id })
      render json: {'token': token, 'user_id': @user.id }
    else
      render json: {'error': 'User already exists!'}
    end
  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
