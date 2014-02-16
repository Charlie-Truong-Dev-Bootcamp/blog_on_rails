Blog::Application.routes.draw do
  #Posts
  root to: 'posts#index'
  get '/posts/new', to: 'posts#new', as: :new_post
  post '/posts', to: 'posts#create', as: :create_post
  get '/posts/:post_id', to: 'posts#show', as: :post
  get '/posts/:post_id/edit', to: 'posts#edit', as: :edit_post
  put '/posts/:post_id', to: 'posts#update', as: :update_post
  delete '/posts/:post_id', to: 'posts#destroy', as: :delete_post

  #Tags
  get '/tags/:tag_id/posts', to: 'tags#posts', as: :tags_posts

  # Users
  get   '/users/new', to: 'users#new', as: :new_user
  get   '/users/:user_id/posts', to: 'users#posts', as: :users_posts
  post '/users', to: 'users#create', as: :create_user

  #Session
  get    '/sign-in', to: 'sessions#new', as: :sign_in
  post   '/sign-in', to: 'sessions#create', as: :authenticate
  delete '/sign-out', to: 'sessions#destroy', as: :sign_out
end
