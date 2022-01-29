class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def
    @user = User.find(params[:id])
  end
end
