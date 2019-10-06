Rails.application.routes.draw do

devise_for :users
root 'reviews#index'

resources :users, only: :show
resources :reviews, only: [:index, :new, :create, :destroy, :edit, :update]

end
