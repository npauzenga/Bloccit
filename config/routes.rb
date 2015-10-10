Rails.application.routes.draw do
  devise_for :users

  resources :topics do
    resources :posts, except: [:index] do
      resource :summary
    end
  end

  get 'about' => 'welcome#about'
  get 'welcome/contact'
  root to: 'welcome#index'
end
