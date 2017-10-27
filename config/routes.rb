Rails.application.routes.draw do
  get 'pages/home'
  resources :locations

  root 'pages#home'

  devise_for :users

  devise_scope :user do
  	get '/login', to: 'devise/sessions#new'
  	get '/logout', to: 'devise/sessions#destroy', as: :signout
  end

  get 'submit' => 'pages#submit'
  get 'about' => 'pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
