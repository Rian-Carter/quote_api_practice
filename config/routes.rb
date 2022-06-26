Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :quotes
    end
  end
  namespace :api do
    namespace :v2 do
      resources :quotes
    end
  end
end
