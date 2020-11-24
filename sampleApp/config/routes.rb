Rails.application.routes.draw do
  resources :sublist_types
  resources :transactions
  resources :transaction_types
  resources :items
  resources :users
  resources :entities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
