Player1orlando::Application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :users, :only => :show
  resources :categories
  resources :beer_styles
  resources :drinks
  resources :games
  resources :katy_corners, :path => "katys"
  
  get '/beverages/', to: 'categories#index', as: 'beverages', :defaults => { :area => 'drinks' }
  get '/play/', to: 'categories#index', as: 'play', :defaults => { :area => 'games' }
  
  
  root 'pages#index'
end
