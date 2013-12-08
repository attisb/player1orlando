Player1orlando::Application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :users, :only => :show
  root 'pages#index'
end
