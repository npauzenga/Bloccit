Rails.application.routes.draw do
  get 'comments/create'

  resources :posts, :questions
  resources :advertisements, only: [:index, :show]
  devise_for :users
  resources :users, only: [:update]


  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
  end

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  # implied hash, could be written root({to: 'welcome#index'})
  root to: 'welcome#index'
end
