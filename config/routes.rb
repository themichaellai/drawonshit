Drawonshit::Application.routes.draw do
  root to: 'doodles#index'
  devise_for :users, :controllers => { omniauth_callbacks:"omniauth_callbacks" }

  resources :doodles, only: [:index, :show, :create] do 
    collection do
      get 'recent'
    end
    member do
      put "upvote", to: "doodles#upvote" 
      put "downvote", to: "doodles#downvote" 
    end
  end

  resources :players do
    get 'draw'
  end
end
