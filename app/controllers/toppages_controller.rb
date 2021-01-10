class ToppagesController < ApplicationController
  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(30)
  end
end
