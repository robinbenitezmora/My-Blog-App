class PostsController < ApplicationController
  def index
    @user = params[:user_id]
    @posts = Post.where(user_id: @user)
  end

  def show
    @user = params[:user_id]
    @post = Post.find_by!(id: params[:id], user_id: params[:user_id])
  end
end
