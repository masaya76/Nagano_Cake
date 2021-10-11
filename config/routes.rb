Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about',  to:"homes#about"
  
  namespace :admin do
    resources :items
  end

end 