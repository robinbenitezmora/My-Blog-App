class LikesController < ApplicationController
  def create
    like = Like.new(likes_params)
    like.save

    if like.save
      redirect_back(fallback_location: root_path)
    else
      puts 'Error by creating like'
    end
  end

  def likes_params
    params.require(:like).permit(:author_id, :post_id)
  end
end
