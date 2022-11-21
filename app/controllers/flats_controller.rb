class FlatsController < ApplicationController
  before_action :set_flat

  def index
    @flats = Flat.all
  end

  private
end
