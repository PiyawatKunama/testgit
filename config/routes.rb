Rails.application.routes.draw do
  devise_for :users
  get 'articles/new'

  get 'users/user'

  resources :articles do
    member do
      get 'read' # /articles/:id/read
    end

    collection do
      get 'read' # /articles/read
    end
  end

  resources :articles do
    resources :comments
  end
  
  root 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
