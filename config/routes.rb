Crazybets::Application.routes.draw do
  resources :bets

  root :to => 'bets#index'
end
