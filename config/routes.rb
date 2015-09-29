Rails.application.routes.draw do
	root :to => "pages#home"
	get '/home' => 'pages#home'
	get '/cook' => 'pages#cook'

	get '/users/:id/edit' => 'users#edit', as: 'your_account'
	resources :shopping_carts
	resources :categories
	resources :line_items
	resources :items
	resources :users

	resources :payment
	
	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	delete '/login' => 'sessions#destroy'
end
