Rails.application.routes.draw do
	root :to => "pages#home"
  get '/home' => 'pages#home', :as => '/home'

  resources :shopping_carts
  resources :categories
  resources :line_items
  resources :items
  resources :users

  get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'
 delete '/login' => 'sessions#destroy'
end
