class SubsController < ApplicationController
  before_action :require_logged_in, except: [:index, :show]
  before_action :require_users_sub, only: [:edit, :update, :destroy]

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.mod_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end
  

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
      if @sub.update
        redirect_to sub_url(@sub)
      else
        flash.now[:error] = @sub.errors.full_messages
        render :edit
      end
  end
  

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end


  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_user_owns_sub
    @sub = Sub.find(params[:id])
    @sub.mod_id == current_user.id
  end

end
