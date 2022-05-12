Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'courses/index'
      get 'users/index'

      patch '/users/:email', to: 'users#update'
      get '/users/:email', to: 'users#show'
    end
  end

  root 'home#index'
end
