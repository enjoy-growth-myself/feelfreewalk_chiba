Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about' => "home#about"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show,:index,:edit,:create,:update]
  resources :postarticles do
  	resources :postarticle_images 
  end

  resources :postarticle_images
end
