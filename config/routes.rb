Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'pages/home'
  resources :locations

  root 'pages#home'

  devise_for :users

  devise_scope :user do
  	get '/login', to: 'devise/sessions#new'
  	delete '/logout', to: 'devise/sessions#destroy', as: :signout
  end

  
  get 'submit' => "submissions#new"
  match '/submissions', to: 'submissions#new', via: 'get'
  resources "submissions", only: [:new, :create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
