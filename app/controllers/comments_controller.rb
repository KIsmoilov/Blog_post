class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @user = @post.author
  end

  def index
    @comments = Comment.all.where(author_id: params.require(:user_id), post_id: params.require(:post_id))
  end

  def create
    @comment = Comment.new(comments_params)
    @comment.author = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_to user_post_path(@comment.post.author, @comment.post)
    else
      render :new
    end
  end

  def destroy
    Comment.find_by(id: params[:comment_id]).destroy
    return render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false if @comment.nil?

    redirect_to user_post_path(@user, params[:post_id])
    if @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
    else
      flash[:alert] = ['Comment not deleted']
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end
end
