Rails.application.routes.draw do
  
  devise_for :admins
  root 'welcome#index'
  
  resources :posts do
    resources :comments
    resources :ratings
  end
  
  resources :categories

end
