Betastore::Application.routes.draw do

  get '/login' => 'logins#new', as: 'login'
  post '/login' => 'logins#create'
  delete '/login' => 'logins#destroy', as: 'logout'

  get '/sign_up' => 'customers#new', as: 'new_customer'
  post '/sign_up' => 'customers#create'
  get '/customers/:id' => 'customers#show', as: 'customer'

  get '/verify/:token' => 'customers#verify', as: 'verify_customer'

  namespace :admin do
    resources :products
    get '/login' => 'logins#new', as: 'logins'
    post '/login' => 'logins#create'
  end

  resources :subscriptions

  get '/products' => 'products#index', as: 'products'
  get '/products/:id' => 'products#show', as: 'product'

  post "/products/:product_id/add_to_cart" => 'carts#create',
    as: "add_product_to_cart"

  resource :cart
  resources :orders

  root 'products#index'

end

