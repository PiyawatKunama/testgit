Rails.application.routes.draw do
  # devise_for :users
  get 'articles/new'

  
  resources :users
  # index => list
  # new => form
  # edit => form
  # show => detail
  # create
  # update
  # destroy

  resources :articles do
    member do
      get 'read' # /articles/:id/read
    end

    collection do
      get 'read' # /articles/read
    end

    resources :comments
  end
  
  root 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
