Rails.application.routes.draw do
  devise_for :users,
  controllers:  { omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations' }

  root 'products#index'

  resources :products do
    collection do
      get 'search'
      post '/:id/pay' => 'products#pay', as: 'pay'
      get '/:id/user_buying' => 'products#user_buying'
      get '/get_category_children' => 'products#get_category_children', defaults: { format: 'json' }
      get '/get_category_grandchildren' => 'products#get_category_grandchildren', defaults: { format: 'json' }
      get '/:parent_id/category_search_parent' => 'products#category_search_parent'
      get '/:parent_id/:child_id/category_search_child' => 'products#category_search_child'
      get '/:parent_id/:child_id/:grandchild_id/category_search_grandchild' => 'products#category_search_grandchild'
    end
  end

  resources :users ,only: [:show] do
    collection do
      get '/:id/logout' => 'users#logout'
      get '/:id/credit' => 'users#credit'
      get '/:id/credit_add' => 'users#credit_add'
      get '/:id/profile_edit' => 'users#profile_edit'
      get '/:id/user_check' => 'users#user_check'
      get '/:id/appear_notice' => 'users#appear_notice'
      get '/:id/appear_todo' => 'users#appear_todo'
      get '/:id/appear_transation' => 'users#appear_transation'
      get '/:id/appear_after_transation' => 'users#appear_after_transation'    
    end
  end

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
  
end
