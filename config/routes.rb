Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
   root 'welcome#index'
   get 'my_portfolio', to: 'users#my_portfolio'
   get 'search_stock', to: 'stocks#search'
   get 'my_friends', to: 'users#my_friends'
   get 'search_friend', to: 'users#search'
   get 'add_friend', to: 'users#add_friend'
   get 'remove_friend', to: 'users#remove_friend'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
