Player1orlando::Application.routes.draw do
  resources :beer_styles

  devise_for :admins
  devise_for :users
  resources :users, :only => :show
  resources :categories
  
  get '/beverages/', to: 'categories#index', as: 'beverages', :defaults => { :area => 'drinks' }
  get '/play/', to: 'categories#index', as: 'play', :defaults => { :area => 'games' }
  
  
  root 'pages#index'
end
