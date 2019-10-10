Rails.application.routes.draw do
  root 'products#index'
  resources :products
  # get '/products/signup' => 'products#signup'

end
