class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def updated
    @user = User.find(params[:id])
    if @user.update(params.require(:user),permit(:name, :email, :avatar))
      flash[:notice] = "アカウント情報を更新しました"
      redirect_to :users
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction)
  end
end
