Rails.application.routes.draw do
  root 'pages#home'

  namespace :api do
    namespace :v1 do
      post '/games',          to: 'games#create'
      get  '/games/:id/play', to: 'games#play'
    end
  end
end
