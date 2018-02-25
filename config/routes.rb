Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/home'

  root 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "registrations" }

  devise_scope :user do
  	get '/login', to: 'devise/sessions#new'
  	delete '/logout', to: 'devise/sessions#destroy', as: :signout
  end

  resources :locations do
    member do
      put "verify", to:     "locations#verify"
      put "flag", to:  "locations#flag"
    end
  end
  
  get 'submit' => "submissions#new"
  match '/submissions', to: 'submissions#new', via: 'get'
  resources "submissions", only: [:new, :create]


  get 'terms' => "pages#terms"
  get 'privacy' => "pages#privacy"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
