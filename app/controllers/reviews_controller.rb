class ReviewsController < ApplicationController
before_action :redirect_to_index, :except => [:index]

def index
    @reviews = Review.includes(:user).page(params[:page]).per(10).order("created_at DESC")
  end

  
private
  def review_params
    params.permit(:title, :body)
  end

  def id_params
    params.permit(:id)
  end

  def redirect_to_index
    redirect_to :action => "index" unless user_signed_in?
  end
end