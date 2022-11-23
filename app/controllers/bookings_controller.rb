class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    start_date = Date.new(
      params[:booking]["start_date(1i)"].to_i,
      params[:booking]["start_date(2i)"].to_i,
      params[:booking]["start_date(3i)"].to_i
    )
    end_date = Date.new(
      params[:booking]["end_date(1i)"].to_i,
      params[:booking]["end_date(2i)"].to_i,
      params[:booking]["end_date(3i)"].to_i
    )

    flat = Flat.find(params[:flat_id])
    price = (end_date - start_date)*(flat.price_per_night)

    @booking = Booking.new(
      start_date: start_date,
      end_date: end_date,
      user: current_user,
      flat: flat,
      total_price: price
    )

    @booking.save
    redirect_to root_path, notice: "Booking completed"
  end
end
