Rails.application.routes.draw do
  get 'homes/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root to: 'homes#top'
 resources :books, only: [:index, :show, :create, :edit, :destroy]

 root 'users#show'
 resources :users, only: [:index, :show, :update, :edit]
end
