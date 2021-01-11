class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      flash[:warning] = 'ログインしてください。'
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_posts = user.posts.count
  end
  
  def evaluation_params
    params.require(:evaluation).permit(:item_title_1, :item_amount_1, :item_title_2, :item_amount_2, :item_title_3, :item_amount_3)
  end
end
