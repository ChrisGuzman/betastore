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

  # resources :customers
  resources :subscriptions
  root :to => 'subscriptions#new'
  get '/sign_up' => 'customers#new', as: 'new_customer'
  post '/sign_up' => 'customers#create'
  get '/customers/:id(.:format)' => 'customers#show', as: 'customer'

  get '/products' => 'products#index', as: 'products'
end

