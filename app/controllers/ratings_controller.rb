class RatingsController < ApplicationController
  before_action :set_rating, only: %i[new create]
  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @flat = Flat.find(params[:flat_id])
    @rating.flat = @flat
    if @rating.save
      redirect_to flat_path[@flat]
    else
      @booking = Booking.new
      render "flats/show", status: :unprocessable_entity
    end
  end

  private

  def set_rating
    @rating = Rating.find(params[:rating_id])
  end

  def rating_params
    params.require(:rating).permit(:rating, :comment)
  end
end
