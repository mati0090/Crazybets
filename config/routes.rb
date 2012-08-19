Crazybets::Application.routes.draw do
  resources :bets
  resource :account, :controller => :users

  resource :login, :controller => :user_sessions, :only => [:new, :create, :destroy]

  root :to => 'bets#index'
end
