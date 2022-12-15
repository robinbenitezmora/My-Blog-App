Rails.application.routes.draw do
  # namespace :api do
  #   namespace :v1 do
  #     get 'comments/index'
  #     get 'comments/create'
  #     get 'users/index'
  #     get 'users/show'
  #     get 'posts/index'
  #     get 'posts/show'
  #   end
  # end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end

  # ROUTES FOR API
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts, format: :json do
          resources :comments, format: :json
          resources :likes, format: :json
        end
      end
    end
  end
end
