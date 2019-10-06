class ReviewsController < ApplicationController
  # before_action :redirect_to_index, :except => [:index]

  def index
    @reviews = Review.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    redirect_to root_path
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  def edit
    @review = Review.find(id_params[:id])
  end

  def update
    review = Review.find(id_params[:id])
    review.update(review_params)
    # if tweet.user_id == current_user.id
    redirect_to root_path
  end


  private

  def review_params
    params.require(:review).permit(:title, :family_name, :first_name, :place, :body).merge(user_id: current_user.id)
  end

  def id_params
    params.permit(:id)
  end

  def redirect_to_index
    redirect_to :action => "index" unless user_signed_in?
  end
end