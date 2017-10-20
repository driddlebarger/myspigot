Rails.application.routes.draw do
  get 'pages/home'
  resources :locations

  root 'pages#home'

  devise_for :users

  get 'submit' => 'pages#submit'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
