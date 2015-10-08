Rails.application.routes.draw do
  resources :posts, :questions
  resources :advertisements, only: [:index, :show]
  devise_for :users
  resources :users, only: [:update]


  resources :topics do
    resources :posts, except: [:index]
  end

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  # implied hash, could be written root({to: 'welcome#index'})
  root to: 'welcome#index'
end
