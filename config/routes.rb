Player1orlando::Application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'pages#index'
end
