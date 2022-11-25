class PagesController < ApplicationController
  def home
    @flats_with_best_carbon_footprint = Flat.where(carbon_footprint: 0..30)
  end
end
