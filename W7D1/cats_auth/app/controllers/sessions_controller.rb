class SessionsController < ApplicationController
  before_action :require_no_user!, only: %i(create new)

  def new
    render :new
  end
  
  def create
    username = params[:user][:username]
    password = params[:user][:password]
    @user = User.find_by_credentials(username, password)
    if @user.nil?
      render :new
    else
      login_user!(@user)
      redirect_to cats_url
    end
  end
  

  def destroy
    logout_user!
    redirect_to new_session_url
  end
  
end
