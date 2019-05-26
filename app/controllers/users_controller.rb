class UsersController < ApplicationController
  include SessionsHelper
  before_action :require_user_logged_in, only: [:show, :edit, :new, :create, :updat]
  
  
  def index
      # @user = user.find(params[:id])
   
      if params[:content]
        @items = Item.where(['content LIKE ?', "#{params[:content]}"])
      else
        @items = Item.order(id: :desc).page(params[:page]).per(20)
      end
  
    #@items = Item.order(id: :desc).page(params[:page]).per(20)
    #@items = Item.search(params[:search])
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(current_user.id)

    @items = @user.items.order(id: :desc).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザー登録完了しました'
      redirect_to root_url
    else
      flash[:danger] = 'ユーザー登録に失敗しました。'
      render :new
    end
    
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] ='編集が完了しました'
      redirect_to @user
    else
      flash[:danger] = '不正です。'
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :content)
  end
  

  
end
