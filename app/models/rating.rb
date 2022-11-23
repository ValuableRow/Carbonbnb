class Rating < ApplicationRecord
  belongs_to :booking
  before_action :set_flat, only: %i[new, create]
  def new
    @flat = Flat.find(params[:flat_id])
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.flat = @flat
    @rating.save
    redirect_to flat_path[@flat]
  end

  private


end
