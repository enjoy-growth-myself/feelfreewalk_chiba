Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about' => 'home#about'

  #userのログインは、applicationコントローラーを使用
  devise_for :users , controllers: {
    sessions: 'user_devises/sessions',
    registrations: 'user_devises/registrations'
  }
  #adminのログインは、sessionsコントローラーを使用
  devise_for :admins, controllers: {
    sessions: 'admin_devises/sessions',
    registrations: 'admin_devises/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show index edit create update] do
    get 'users/bookmark' => 'users#bookmark', as: 'bookmarks'
  end

  resources :postarticles do
    resources :postarticle_comments, only: %i[create destroy]
    resources :postarticle_images, shallow: true
    resource :bookmark, only: %i[create destroy], shallow: true
  end

  get '/search', to: 'search#search'

  # 管理者のルート
  namespace :admin do
    resources :users, only: [:index, :show, :update]
  end
end
