Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/index'
  root 'pages#index'
  get 'home' => "pages#home"


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "registrations", confirmations: "confirmations", sessions: "sessions" }

  devise_scope :user do
  	get '/login', to: 'devise/sessions#new'
  	delete '/logout', to: 'devise/sessions#destroy', as: :signout
    patch '/user/confirmation' => 'confirmations#update', :via => :patch, :as => :update_user_confirmation
    #patch "/confirm" => "confirmations#confirm"
  end

  resources :locations do
    member do
      put "verify", to:     "locations#verify"
      put "flag", to:  "locations#flag"
    end
  end
  
  get 'submit' => "locations#new" #update as part of auto_submit epic
  match '/submissions', to: 'submissions#new', via: 'get'
  resources "submissions", only: [:new, :create]


  get 'terms' => "pages#terms"
  get 'privacy' => "pages#privacy"
  get 'test' => "pages#test"

  
  # For Split dashboard
  mount Split::Dashboard, at: 'split'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
