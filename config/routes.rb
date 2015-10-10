Rails.application.routes.draw do
  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts do
    resource :summary
  end

  get 'about' => 'welcome#about'
  get 'welcome/contact'
  root to: 'welcome#index'
end
