Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about' => "home#about"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show,:index,:edit,:create,:update] do
    get 'users/bookmark' => 'users#bookmark', as: 'bookmarks'
  end

  resources :postarticles  do
    resources :postarticle_comments, only: [:create, :destroy]
    resources :postarticle_images, shallow: true
  	resource :bookmark, only: [:create, :destroy], shallow: true
  end

  get '/search', to: 'search#search'
end
