Rails.application.routes.draw do
  resources :locations
  devise_for :users
  root 'pages#home'
  get 'submit' => 'pages#submit'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
