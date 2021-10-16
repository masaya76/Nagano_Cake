Rails.application.routes.draw do

  namespace :public do
    get 'items/index'
    get 'items/show'
  end
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
      patch '/customers/withdrawal', to: 'customer#update'
    resources :cart_items, only: [:index, :update, :destroy, :create]
      delete '/cart_items', to: 'cart_item#destroy_all'
    resources :orders, only: [:top, :update, :index, :show]
      get "orders/top" => "orders#top"
      post 'orders/confirm', to: 'orser#confirm' 
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
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