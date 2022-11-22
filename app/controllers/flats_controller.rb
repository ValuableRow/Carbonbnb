class FlatsController < ApplicationController
  def new
    @flat = Flat.new
  end

  def index
    @flats = Flat.all
  end

  def show
    @flats = Flat.find(params[:id])
  end

  def edit
  end
end
