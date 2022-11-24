require 'date'

class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
      @role = role(@user)
      @redir = params[:redir_param].nil? ? 0 : params[:redir_param].to_i
      # booking
      @bookings_current = @user.bookings.where('end_date > ? ', Date.today)
      @bookings_historic = @user.bookings.where('end_date <= ? ', Date.today)
       # orders
        @orders_current =  Booking.joins(:flat).where('flats.user_id = ? ', @user.id).where('bookings.end_date > ? ', Date.today)
        @orders_historic =  Booking.joins(:flat).where('flats.user_id = ? ', @user.id).where('bookings.end_date <= ? ', Date.today)
       end
   
    private

    def role(puser)
       return puser.host ? "Host" : "Guest"
    end

end
