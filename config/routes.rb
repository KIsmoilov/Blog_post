Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :index]
      resources :likes, only: [:create]
    end
  end

  delete '/users/:user_id/posts/:post_id', to: 'posts#destroy', as: 'delete_user_post'
  post '/users/:user_id/posts/:post_id/comments', to: 'comments#create', as: 'create_user_post_comment'
  delete '/users/:user_id/posts/:post_id/comments/:comment_id', to: 'comments#destroy', as: 'delete_user_post_comment'

  namespace :api do
    get "/users/:user_id/posts", to: "posts#index", as: "user_posts_api"
    get "/users/:user_id/posts/:post_id/comments", to: "comments#index", as: "post_comments_api"
    post "/users/:user_id/posts/:post_id/comments", to: "comments#create", as: "create_comment_api"
  end
end
