class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :image))
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "ルームを登録しました"
      redirect_to "http://127.0.0.1:3000/"
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def search
    @rooms = Room.search(params[:search])
  end
end
