class PostsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end

  def search
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :capture)
  end
end
