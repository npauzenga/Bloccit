Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  # implied hash, could be written root({to: 'welcome#index'})
  root to: 'welcome#index'
end
