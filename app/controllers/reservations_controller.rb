class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, end_date, :people, :user_id, :room_id))
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to "rooms_index"
    else
      render "reservations"
    end
  end

private
 def reservation_params
   params.require(:reservation).permit(:start_date, :end_date, :room_id, :user_id, :people)
 end
end

