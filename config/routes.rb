Rails.application.routes.draw do
	root :to => "pages#home"
	get '/home' => 'pages#home', :as => '/home'
	get '/cook' => 'pages#cook', :as => '/cook'
	resources :shopping_carts
	resources :categories
	resources :line_items
	resources :items
	resources :users
	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	delete '/login' => 'sessions#destroy'
end
