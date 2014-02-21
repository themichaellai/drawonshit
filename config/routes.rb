Drawonshit::Application.routes.draw do
  root to: 'doodles#index'

  resources :doodles
end
