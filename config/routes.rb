Rails.application.routes.draw do
  devise_for :users,
  controllers:  { omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations' }

  root 'products#index'

  get '/products/get_category_children' => 'products#get_category_children', defaults: { format: 'json' }
  get '/products/get_category_grandchildren' => 'products#get_category_grandchildren', defaults: { format: 'json' }

  get '/products/:id/user_buying' => 'products#user_buying'

  get '/users/:id/logout' => 'users#logout'
  get '/users/:id/credit' => 'users#credit'
  get '/users/:id/credit_add' => 'users#credit_add'
  get '/users/:id/profile_edit' => 'users#profile_edit'
  get '/users/:id/user_check' => 'users#user_check'

  get '/users/:id/appear_notice' => 'users#appear_notice'
  get '/users/:id/appear_todo' => 'users#appear_todo'
  get '/users/:id/appear_transation' => 'users#appear_transation'
  get '/users/:id/appear_after_transation' => 'users#appear_after_transation'

  resources :signup, only: [:create] do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'
      get 'step6'
      get 'done'
    end
  end

  resources :products ,only: [:new,:create,:show]
  resources :users ,only: [:show]
  
end
