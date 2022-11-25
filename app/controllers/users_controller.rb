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
      # empties? 
      @bookings_current_exist = @bookings_current.count > 0 ? true : false
      @bookings_historic_exist = @bookings_historic.count > 0 ? true : false
      @orders_current_exist = @orders_current.count > 0 ? true : false
      @orders_historic_exist = @orders_historic.count > 0 ? true : false

       end
   
    private

    def role(puser)
       return puser.host ? "Host" : "Guest"
    end

end
