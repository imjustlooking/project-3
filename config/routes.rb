Rails.application.routes.draw do
  #root routes
  root 'main#index'

  #user routes
  devise_for :users, path: '', path_names: {
    sign_in: 'login', sign_out: 'logout',
   sign_up: 'register'}

 resources :users, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/:id', to: 'users#show'

  #shoppinglist routes
  resources :users do
    put 'shoppinglist/:id', to: 'shopplinglist#paid'
    resources :shoppinglists
  end

  #stock routes
  resources :stocks
  #custom routes for barcode scanning page
  get '/stocks/show', to: 'stocks#show'
  get '/stocks/?category_type=:id', to: 'stocks#show', as: 'stocks_type'
  resources :items
  # post '/items/create', to: 'items#create'
  get 'items/create'
  get '/items/add', to: 'items#create'

   resources :charges, only: [:new, :create]
   post '/charges/:id', to: 'charges#create', as: 'charges_test'

end
