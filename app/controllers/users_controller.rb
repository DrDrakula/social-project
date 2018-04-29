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
    user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email],password: params[:password])
    if user.valid?
      user.save
      user.update(slug: params[:first_name].strip.downcase + '-' + params[:last_name].strip.downcase + '-' + user.id.to_s)
      token = issue_token({ 'user_id': user.id })
      render json: {'token': token, 'user_id': user.id, 'first_name': user.first_name, 'last_name': user.last_name, 'slug': user.slug}
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
