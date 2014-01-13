Player1orlando::Application.routes.draw do
  devise_for :admins
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  resources :users, :only => [:show, :index, :edit, :update, :destroy]
  resources :katy_corners, :path => "katys"
  resources :trackers, :path => "drink_tracker" do
    member do
      get 'track'
      post 'point_track'
    end
  end
  resources :categories, :beer_styles, :drinks, :games, :events
  
  get '/citizen/checkin', to: 'pages#citizen_checkin', as: 'citizen_checkin'
  resources :rewards, :path => "citizen" do
    member do
      # get 'redeem'
      # post 'post_redeem'
      # post 'post_citizen_checkin'
    end
  end
  get '/rewards/redemption', to: 'rewards#redeem', as: 'redeem_reward'
  post '/rewards/redeem', to: 'rewards#post_redeem', as: 'post_redeem_reward'
  post '/rewards/post_user_redeem', to: 'rewards#post_user_redeem', as: 'post_user_redeem_reward'
  post '/citizen/checkin/process', to: 'rewards#post_citizen_checkin', as: 'post_citizen_checkin_reward'
  get '/katys/feed', to: 'katy_corners#feed', as: 'katy_rss'
  
  get '/rate/drink/:id/:rating', to: 'ratings#set_rating', as: 'set_rating'
  get '/rate/game/:id/:rating', to: 'ratings#set_game_rating', as: 'set_game_rating'
  get '/rewards/issue/:id', to: 'rewards#issue', as: 'issue_reward'
  get '/d/:code/:user_id', to: 'rewards#user_redeem', as: 'user_redeem'
  
  get '/beverages/', to: 'categories#index', as: 'beverages', :defaults => { :area => 'drinks' }
  get '/beverages/hidden', to: 'categories#allhidden', as: 'hidden_beverages', :defaults => { :area => 'drinks' }
  get '/play/', to: 'categories#index', as: 'play', :defaults => { :area => 'games' }
  get '/play/hidden', to: 'categories#allhidden', as: 'hidden_play', :defaults => { :area => 'games' }
  
  get '/manual/rewards', to: 'pages#rewards', as: 'rewards_page'
  get '/manual/rules', to: 'pages#rules', as: 'rules_page'
  
  
  root 'pages#index'
end
