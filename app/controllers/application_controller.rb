class ApplicationController < ActionController::Base
    
  private
    
  def require_user_logged_in
    unless logged_in?
      redirect_to root_url
      flash[:danger] = 'ログインしてください'
    end
  end
    
  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    unless @item
    redirect_to root_url
    flash[:danger] = '不正なアクションです'
    end
  end
end
