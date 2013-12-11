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
  
  resources :rewards do
    member do
      get 'redeem'
      post 'post_redeem'
    end
  end
  
  get '/set_rating/:id/:rating', to: 'ratings#set_rating', as: 'set_rating'
  get '/set_game_rating/:id/:rating', to: 'ratings#set_game_rating', as: 'set_game_rating'
  get '/rewards/issue/:id', to: 'rewards#issue', as: 'issue_reward'
  
  get '/beverages/', to: 'categories#index', as: 'beverages', :defaults => { :area => 'drinks' }
  get '/play/', to: 'categories#index', as: 'play', :defaults => { :area => 'games' }
  
  get '/manual/rewards', to: 'pages#rewards', as: 'rewards_page'
  
  root 'pages#index'
end
