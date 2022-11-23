class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
      @role = role(@user)
    end
   
    private

    def role(puser)
       return puser.host ? "Host" : "Guest"
    end

end
