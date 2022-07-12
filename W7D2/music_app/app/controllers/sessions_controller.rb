class SessionsController < ApplicationController
    before_action :require_logged_in, only: [:destroy]

    def new
        render :new
    end

    def create
        email = params[:user][:email]
        password = params[:user][:password]
        @user = User.find_by_credentials(email, password)
        if @user
          login!(@user)
          redirect_to bands_url
        else
          flash.now[:error] = "Cant find ya monkey. try signing up first or maybe incorrect username/pass idk"
          render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
end
