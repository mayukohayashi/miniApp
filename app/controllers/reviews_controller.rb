class ReviewsController < ApplicationController
before_action :redirect_to_index, except: :index

def index
  @reviews = Review.includes(:user).page(params[:page]).per(10).order("created_at DESC")
end

def show
  @review = Reviews.find(params[:id])
end

def new
  @review = Review.new
end

def create
  review = Review.create(create_params)
  redirect_to_index
end

def edit
  @review = Review.find(id_params[:id])
end

def update
  review = Review.find(id_params[:id])
  review.update(review_params) if review.user_id == current_user.id
end

private
  def create_params
    params.require(:review).permit(:title, :family_name, :first_name, :place, :body).merge(user_id: current_user.id)
  end

  def id_params
    params.permit(:id)
  end

  def redirect_to_index
    redirect_to :action => "index" unless user_signed_in?
  end
end