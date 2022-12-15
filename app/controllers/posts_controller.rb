class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find_by!(id: params[:user_id])
    respond_to do |format|
      format.html
      format.json { render json: @user.posts }
      format.xml { render xml: @user.posts }
    end
  end

  def show
    @user = User.find_by!(id: params[:user_id])
    @post = Post.find_by!(id: params[:id])
    @post = Post.includes(:comments, :author).find_by!(author_id: params[:user_id], id: params[:id])
    @user = current_user

    respond_to do |format|
      format.html
      format.json { render json: @post.to_json(include: [:comments]) }
      format.xml { render xml: @post }
    end
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    parameters = post_params
    post = Post.new(author_id: current_user.id, title: parameters[:title], text: parameters[:text])
    post.save

    if post.save
      redirect_to user_post_path(current_user)
    else
      redirect_to new_user_post_path(current_user)
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def destroy
    post = Post.find_by!(id: params[:id])
    post.destroy
    flash[:notice] = "The post ##{params[:id]} was deleted"
    redirect_to user_posts_path(current_user)
  end
end
