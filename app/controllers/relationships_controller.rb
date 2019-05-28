class RelationshipsController < ApplicationController
  include SessionsHelper
  before_action :require_user_logged_in, only: [:create, :destroy]
  def create
    item = Item.find(params[:item_id])
    current_user.like(item)
    flash[:success] = 'いいねしました'
    redirect_to item
  end

  def destroy
    item = Item.find(params[:item_id])
    current_user.unlike(item)
    flash[:success] = 'いいねと取り消しました'
    redirect_to item
  end
end
