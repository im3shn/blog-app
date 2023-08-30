Rails.application.routes.draw do
  resources :tags
  root 'topics#index'
  get '/posts', to:'posts#index'
  get 'tags/list/:tag', to: 'posts#index', as: :list_tagged_posts
  resources :topics do
    resources :posts do
      resources :comments
      resources :ratings
    end
  end

end
