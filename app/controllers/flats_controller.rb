class FlatsController < ApplicationController

  def index
    @flats = Flat.all
    if params[:sort] == "rating"
      flats_with_ratings = @flats.select { |flat| flat.average_rating }
      flats_without_ratings = @flats.select { |flat| !flat.average_rating }
      flats_with_ratings = flats_with_ratings.sort_by { |flat| -flat.average_rating }
      @flats = flats_with_ratings + flats_without_ratings
    elsif params[:sort] == "price"
      @flats = @flats.sort_by { |flat| flat.price_per_night }
    end
  end
end
