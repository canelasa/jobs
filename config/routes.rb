Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :jobs do
    resources :registers
  end
  resources :users, only: :show
  match 'save', to: 'saves#save', via: :post
  match 'undo', to: 'saves#undo', via: :delete
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
