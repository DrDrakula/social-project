class PostsController < ApplicationController

  def index
    posts = Post.all
    render json: posts
  end

  def show
    post = Post.find_by(id: params[:id])
    render json: post
  end

  def create
    post = Post.new(title: params[:title], content: params[:content], user_id: params[:user_id])
    if post.valid?
      post.save
      render json: {'title': post.title, 'content': post.content, 'created_at': post.created_at, 'id': post.id, 'user': post.user}
    else
      render json: {'error': "Couldn't post this post!"}
    end
  end
end
