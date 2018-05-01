class SessionsController < ApplicationController

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = issue_token({'user_id': user.id})
      render json: {'token': token, 'user_id': user.id, 'first_name': user.first_name, 'last_name': user.last_name, 'slug': user.slug, 'posts': user.posts}
    else
      render json: {'error': 'Incorrect email or password!'}, status: 401
    end
  end

end
