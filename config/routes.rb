Rails.application.routes.draw do
  resources :customers
  resources :employees
  devise_for :users


   as :user do
     get '/users/sign_out' => 'devise/sessions#destroy'
   end
  get 'logins/index'

  get 'forms/index'

  get 'datatables/index'

  get 'dashboards/index'

  get '/customers/new' => 'customers#new'

  post '/customers' => 'customers#create'

  get '/customers/:id' => 'customers#show'

  get '/customers/:id/edit' => 'customers#edit'

  patch '/customers/:id' => 'customers#update'

  delete '/customers/:id' => 'customers#destroy'

  resources :users do
    member do
      get :change_password
      patch :update_password
    end
  end
  root to: "dashboards#index"


  resources :datatables
  resources :forms
  resources :logins

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
