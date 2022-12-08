class CommentsController < ApplicationController
  def new
    @user = User.find_by!(id: params[:user_id])
    @post = User.includes(:posts, :comments).find_by!(id: params[:user_id]).posts.find_by!(id: params[:post_id])
    @comment = @post.most_recent_comments
  end

  def create
    parameters = comment_params
    comment = Comment.new(post_id: params[:post_id], author_id: current_user.id, text: parameters[:text])
    comment.save

    if comment.save
      redirect_to user_post_path(id: params[:post_id], user_id: params[:user_id])
    else
      redirect_to new_user_post_comment_path(id: params[:post_id], user_id: params[:user_id])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
