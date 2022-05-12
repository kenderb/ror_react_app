Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'courses/index'
      get 'users/index'

      patch '/users', to: 'users#update'
    end
  end

  root 'home#index'
end
