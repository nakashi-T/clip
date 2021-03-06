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
    post_counts(@post)
  end
  
  def search
    @posts = Post.search(params[:search])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    flash[:success] = '投稿は削除されました。'
    redirect_to root_url
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :capture, :image_cache, 
    evaluations_attributes: [:item_title_1, :item_amount_1, :item_title_2, :item_amount_2, :item_title_3, :item_amount_3])
  end
  
end
