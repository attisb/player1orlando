Player1orlando::Application.routes.draw do
  
  devise_for :admins
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  
  get '/rewards/redemption', to: 'rewards#redeem', as: 'redeem_reward'
  get '/vip/checkin/process', to: 'pages#process_vip_checkin', as: 'process_vip_checkin'
  post '/rewards/redeem', to: 'rewards#post_redeem', as: 'post_redeem_reward'
  post '/rewards/post_user_redeem', to: 'rewards#post_user_redeem', as: 'post_user_redeem_reward'
  post '/citizen/checkin/process', to: 'rewards#post_citizen_checkin', as: 'post_citizen_checkin_reward'
  post '/membership/process', to: 'pages#process_memberships', as: 'process_memberships'
  
  get '/rate/drink/:id/:rating', to: 'ratings#set_rating', as: 'set_rating'
  get '/rate/game/:id/:rating', to: 'ratings#set_game_rating', as: 'set_game_rating'
  get '/rewards/issue/:id', to: 'rewards#issue', as: 'issue_reward'
  get '/d/:code/:user_id', to: 'rewards#user_redeem', as: 'user_redeem'
  
  get '/beverages/', to: 'categories#index', as: 'beverages', :defaults => { :area => 'drinks' }

  get '/beverages/dispense/:dispense_type', to: 'beverages#show_by_dispense_type', as: 'dispense_beverages'
  get '/beverages/updates/:update_style', to: 'beverages#show_by_update_style', as: 'update_beverages'
  get '/beverages/printable/:dispense_type', to: 'beverages#show_by_printable', as: 'printable_beverages'
  get '/beverages/printable/:dispense_type/:dispense_type2', to: 'beverages#show_by_printable', as: 'printable_beverages2'
  get '/beverages/printable/:dispense_type/:dispense_type2/:dispense_type3', to: 'beverages#show_by_printable', as: 'printable_beverages3'
  get '/beverages/printable_custom/:view_options', to: 'beverages#show_by_printable_custom', as: 'printable_custom'

  get '/beverages/hidden', to: 'categories#allhidden', as: 'hidden_beverages', :defaults => { :area => 'drinks' }
  get '/play/', to: 'categories#index', as: 'play', :defaults => { :area => 'games' }
  get '/play/hidden', to: 'categories#allhidden', as: 'hidden_play', :defaults => { :area => 'games' }
  
  get '/manual/info', to: 'pages#info', as: 'infos_page'
  get '/manual/vips', to: 'pages#vips', as: 'vips_page'
  get '/manual/citizens', to: 'pages#rewards', as: 'rewards_page'
  get '/manual/rules', to: 'pages#rules', as: 'rules_page'
  get '/manual/terms', to: 'pages#terms', as: 'terms_page'
  get '/manual/privacy', to: 'pages#privacy', as: 'privacy_page'
  get '/feed', to: 'pages#feed', as: 'feed_rss'
  get '/food', to: 'pages#food', as: 'food_page'
  get '/music', to: 'pages#music', as: 'music_page'
  get '/bartender_choice', to: 'pages#bartender_choice', as: 'bartender_choice_page'
  get '/leaderboard', to: 'pages#leaderboard', as: 'leaderboard_page'

  get '/tvboards/draft', to: 'taps#tvboard', as: 'tvboard_draft_page'
  get '/tvboards/bottle/:id', to: 'drinks#tvscreen', as: 'tvboard_bottle_page'

  get '/drinks/all/edit', to: 'drinks#edit_all', as: 'edit_all_drinks'
  put '/drinks/all', to: 'drinks#update_all', as: 'update_all_drinks'

  
  resources :users, :only => [:show, :index, :edit, :update, :destroy]
  resources :katy_corners, :path => "katys"
  resources :trackers, :path => "drink_tracker" do
    member do
      get 'track'
      post 'point_track'
    end
  end
  resources :categories, :beer_styles, :drinks, :games, :events, :galleries
  resources :taps
  
  
  get '/citizen/checkin', to: 'pages#citizen_checkin', as: 'citizen_checkin'
  resources :rewards, :path => "citizen" do
    member do
      # get 'redeem'
      # post 'post_redeem'
      # post 'post_citizen_checkin'
    end
  end

  
  
  root 'pages#index'
end
