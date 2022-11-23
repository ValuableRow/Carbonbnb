class FlatsController < ApplicationController
  def show
    @flat = Flat.find(params[:id])
  end
end
