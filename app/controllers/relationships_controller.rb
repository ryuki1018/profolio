class RelationshipsController < ApplicationController
  
      before_action :require_user_logged_in
  def create
    user = User.findU(params[:follow_id])
    current_user.follow(language)
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(language)
  end
end
