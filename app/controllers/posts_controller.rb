class PostsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @post = current_user.posts.build
    @post.evaluations.build
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
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @favoriters = @post.favoriters.page(params[:page]).per(30)
    counts(@post)
  end
  
  def search
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :capture, 
    evaluations_attributes: [:item_title_1, :item_amount_1, :item_title_2, :item_amount_2, :item_title_3, :item_amount_3])
  end
  
end
