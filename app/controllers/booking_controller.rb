class BookingController < ApplicationController
  def index
    @bookings = Booking.all
    @rooms = Room.all
    @users = User.all
  end

  def new
  end

  def create
     @booking = current_user.bookings.create(booking_params)
     redirect_to root_path notice:"予約が完了しました"
  end

private
  def booking_params
    params.require(:booking).permit(:start, :end, :room_price, :room_id)
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
