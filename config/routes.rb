Rails.application.routes.draw do
  root 'pages#home'

  namespace :api do
    namespace :v1 do
      get '/games/new', to: 'games#new'
    end
  end
end
