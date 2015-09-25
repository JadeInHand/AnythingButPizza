Rails.application.routes.draw do

  resources :shopping_carts
  resources :categories
  resources :line_items
  resources :items
  resources :users

  get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'
 delete '/login' => 'sessions#destroy'
end
