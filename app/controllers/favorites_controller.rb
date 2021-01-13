class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:like_id])
    current_user.favorite(post)
    flash[:success] = 'いいねしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Post.find(params[:like_id])
    current_user.unfavorite(post)
    flash[:success] = 'いいねを外しました。'
    redirect_back(fallback_location: root_path)
  end
end
