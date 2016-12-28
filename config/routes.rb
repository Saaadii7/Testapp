Rails.application.routes.draw do
  resources :users do
  	resources :micro_posts
  end
 root 'users#index'
end
