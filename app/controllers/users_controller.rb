class UsersController < ApplicationController

  def index
  end

  def show
    # @user = User.find(params[:id])
    # # @nickname = user.name
    # @reviews = user.reviews.page(params[:page]).per(5).order('created_at DESC')
  end

  private
  def show_params
    params.permit(:id)
  end
end
