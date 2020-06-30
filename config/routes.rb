Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about' => "home#about"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show,:index,:edit,:create,:update] do
    get 'users/bookmark' => 'users#bookmark', as: 'bookmarks'
  end

  resources :postarticles, shallow: true do
    resources :postarticle_images
  	resource :bookmark, only: [:create, :destroy]
  	 
  end

  resources :postarticle_images
end
