Rails.application.routes.draw do
  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, shallow: true do
    resources :summaries
  end

  get 'about' => 'welcome#about'
  get 'welcome/contact'
  root to: 'welcome#index'
end
