class UsersController < ApplicationController
  def index
    if request.query_string.present?
      query = User.where("username iLIKE '#{user_params[:username]}'")
      if query.empty?
        render json: 'No User found' 
        return
      else
        render json: query
      end
    else
      render json: User.all
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    render json: params
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: User.all
  end

  private
  def user_params
    params.require(:users).permit(:username)
  end
end 