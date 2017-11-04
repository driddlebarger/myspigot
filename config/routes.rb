Rails.application.routes.draw do
  get 'pages/home'
  resources :locations

  root 'pages#home'

  devise_for :users

  devise_scope :user do
  	get '/login', to: 'devise/sessions#new'
  	delete '/logout', to: 'devise/sessions#destroy', as: :signout
  end

  
  match '/submissions', to: 'submissions#new', via: 'get'
  resources "submissions", only: [:new, :create]


  get 'submit' => 'pages#submit'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
