Rails.application.routes.draw do

devise_for :users
root 'reviews#index'

resources :users
resources :reviews

end