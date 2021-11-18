Rails.application.routes.draw do

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  root to: 'homes#top'
  get 'home/about',  to:"homes#about"

  namespace :public do
    resources :customers, only: [:edit, :update]
      get "customers/top" => "customers#top"
      get "customers/mypage" => "customers#mypage"
      patch "/customers/withdrawal" => "customer#withdrawal"

    resources :cart_items, only: [:index, :update, :destroy, :create]
      delete '/cart_items_destroy_all', to: 'cart_items#destroy_all'

    post 'orders/confirm', to: 'orders#confirm'
    get "orders/top" => "orders#top"
    resources :orders, only: [:new, :create, :index, :show]


    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    get "items/search" => "items#search"
    resources :items, only: [:index, :show]

   end

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }


  namespace :admin do
    root to: 'homes#top'
    resources :homes, only: [:top]
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end



end