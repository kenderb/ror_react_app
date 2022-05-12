Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get 'courses/index'
    end
  end

  root 'home#index'
end
