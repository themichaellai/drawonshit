Drawonshit::Application.routes.draw do
  root to: 'doodles#index'
  devise_for :users, :controllers => { omniauth_callbacks:"omniauth_callbacks" }
  resources :doodles
  resources :players
end
