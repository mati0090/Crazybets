Crazybets::Application.routes.draw do
  resources :bets do
    resources :donations, :only => [:index, :new, :create]
  end
  resource :account, :controller => :users

  resource :login, :controller => :user_sessions, :only => [:new, :create, :destroy]

  resources :profile, :controller => :users, :only => [:show] do
    resources :bets, :only => [:index]
  end

  root :to => 'bets#index'
end
