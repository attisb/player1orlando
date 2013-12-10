Player1orlando::Application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :users, :only => [:show, :index, :edit, :update, :destroy]
  resources :katy_corners, :path => "katys"
  resources :trackers, :path => "drink_tracker" do
    member do
      get 'track'
      post 'point_track'
    end
  end
  resources :categories, :beer_styles, :drinks, :games, :events
  
  get '/set_rating/:id/:rating', to: 'ratings#set_rating', as: 'set_rating'
  
  get '/beverages/', to: 'categories#index', as: 'beverages', :defaults => { :area => 'drinks' }
  get '/play/', to: 'categories#index', as: 'play', :defaults => { :area => 'games' }
  
  
  root 'pages#index'
end
