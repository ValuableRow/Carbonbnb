class RatingsController < ApplicationController

  def create
    @rating = Rating.new(rating_params)
    @booking = Booking.find(params[:booking_id])
    @rating.booking = @booking
    if @rating.save
      redirect_to flat_path(@booking.flat)
    else
      @booking = Booking.new
      render "flats/show", status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :comment)
  end
end
