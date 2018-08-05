Rails.application.routes.draw do
  get 'admin/new'
  get 'admin/index'
  get 'account/', to: 'pages#account'
  resources :availabilities
  resources :lessons
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :charges
  root to: "pages#home"
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
