class UsersController < ApplicationController
    before_action :require_logged_in, except: [:new, :create]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to bands_url
        else
          flash.now[:error] = @user.errors.full_messages
          render :new
        end
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
