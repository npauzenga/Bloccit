Rails.application.routes.draw do
  resources :posts
  resources :advertisements, only: [:index, :show]

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  # implied hash, could be written root({to: 'welcome#index'})
  root to: 'welcome#index'
end
