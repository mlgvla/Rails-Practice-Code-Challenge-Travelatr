Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers
  resources :posts
  resources :destinations

  post '/add_like/:post_id', to: 'posts#add_like', as: 'add_like'
end
