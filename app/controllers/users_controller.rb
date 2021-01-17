class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in, only: [:followings, :followers, :likes]

  # GET /users
  def index
    @users = User.order(id: :desc).page(params[:page]).per(30)
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page]).per(30)
    counts(@user)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page]).per(30)
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page]).per(30)
    counts(@user)
  end
  
  def likes
    @user = User.find(params[:id])
    @favoriteings = @user.favoriteings.page(params[:page])
    counts(@user)
  end

  private
    
    def user_params
      params.require(:user).permit(:name, :email, :image, :password, :password_confirmation, :image_cache)
    end
    
end
