class PostsController < ApplicationController
  def show
    @post = Post.where(author_id: params[:user_id], id: params[:id]).first
    @comments = @post.comments
  end

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end
end
