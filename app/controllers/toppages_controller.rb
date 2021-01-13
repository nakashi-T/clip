class ToppagesController < ApplicationController
  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(20)
    @followings = current_user.followings if current_user
  end
end

