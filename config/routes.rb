Rails.application.routes.draw do
  devise_for :users


   as :user do
     get '/users/sign_out' => 'devise/sessions#destroy'
   end
  get 'logins/index'

  get 'forms/index'

  get 'datatables/index'

  get 'dashboards/index'

  

  root to: "dashboards#index"


  resources :datatables
  resources :forms
  resources :logins

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
