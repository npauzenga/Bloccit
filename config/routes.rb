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

  post "/up-vote" => "votes#up_vote", as: :up_vote
  post "/down-vote" => "votes#down_vote", as: :down_vote

  get 'about' => 'welcome#about'

  get 'welcome/contact'

  # implied hash, could be written root({to: 'welcome#index'})
  root to: 'welcome#index'
end
