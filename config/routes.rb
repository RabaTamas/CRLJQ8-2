Rails.application.routes.draw do
  root 'books#index'

  resources :books, only: [:index, :show]

  resource :cart, only: [:show] do
    post   'add/:book_id',    action: :add,         as: :add_item
    delete 'remove/:book_id', action: :remove,      as: :remove_item
    get    'checkout',        action: :checkout,    as: :checkout
    post   'place_order',     action: :place_order, as: :place_order
  end

  resource :session, only: [:new, :create, :destroy]
  get  '/login',    to: 'sessions#new',     as: :login
  get  '/logout',   to: 'sessions#destroy', as: :logout

  resources :users, only: [:new, :create]
  get '/register', to: 'users#new', as: :register
end
