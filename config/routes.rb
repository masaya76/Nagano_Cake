Rails.application.routes.draw do

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  root to: 'homes#top'
  get 'home/about',  to:"homes#about"

  namespace :public do
    resources :items
    resources :customers, only: [:edit, :update]
      get "customers/top" => "customers#top"
      get "customers/mypage" => "customers#mypage"
      patch '/customers/withdrawal', to: 'customer#update'
   end

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }


  namespace :admin do
    resources :homes, only: [:top]
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end



end