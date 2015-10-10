Rails.application.routes.draw do
  devise_for :users

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :posts, except: [:index, :create] do
    resource :summary
  end

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  # implied hash, could be written root({to: 'welcome#index'})
  root to: 'welcome#index'
end
