Rails.application.routes.draw do
  get '/posts', to:'posts#index'
  resources :topics do
    resources :posts
  end

end
