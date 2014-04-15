Betastore::Application.routes.draw do
  namespace :admin do
    resources :products
    get '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
    # get '/products'     => 'products#index', as: 'products'
    # get '/products/new' => 'products#new', as: 'new_product'
    # get '/products/:id' => 'products#show', as: 'product'

    # post '/products' => 'products#create'

  end

  resources :subscriptions
  root :to => 'subscriptions#new'

  get '/products' => 'products#index', as: 'products'
end

