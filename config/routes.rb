Rails.application.routes.draw do
  root 'topics#index'
  get '/posts', to:'posts#index'
  resources :topics do
    resources :posts do
      resources :comments
    end
  end

end
