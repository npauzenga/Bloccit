Rails.application.routes.draw do
  resources :posts

  get 'about' => 'welcome#about'

  # implied hash, could be written root({to: 'welcome#index'})
  root to: 'welcome#index'
end
