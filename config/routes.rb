Rails.application.routes.draw do
  get 'advertisements/index'

  get 'advertisements/show'

  resources :posts, :advertisements

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  # implied hash, could be written root({to: 'welcome#index'})
  root to: 'welcome#index'
end
