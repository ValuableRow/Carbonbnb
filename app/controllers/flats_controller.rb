class FlatsController < ApplicationController
  def index
    @flats = Flat.all
    if params[:query].present?
      @flats = Flat.global_search(params[:query])
    end
    if params[:sort] == "rating"
      flats_with_ratings = @flats.select { |flat| flat.average_rating }
      flats_without_ratings = @flats.select { |flat| !flat.average_rating }
      flats_with_ratings = flats_with_ratings.sort_by { |flat| -flat.average_rating }
      @flats = flats_with_ratings + flats_without_ratings
    elsif params[:sort] == "price"
      @flats = @flats.sort_by { |flat| flat.price_per_night }
    end
  end


  def show
    @flat = Flat.find(params[:id])
    @rating = Rating.new
    @booking = Booking.new
    @bookings_with_reviews = Booking.joins(:rating)
    @past_bookings = @flat.bookings.where(user: current_user, end_date: ..1.day.ago) - @bookings_with_reviews
    @marker = [{ lat: @flat.latitude, lng: @flat.longitude }]
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    @flat.save!
    redirect_to flat_path(@flat)
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :price_per_night, :location, :capacity, photos: [])
  end
end
