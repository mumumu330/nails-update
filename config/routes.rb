Rails.application.routes.draw do
  get 'home/about' => 'home#about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post_images#index'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:show, :edit, :update]
    get 'follower' => 'users#follower'
    get 'followed' => 'users#followed'
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

  get '/search', to: 'search#search'
  
end
