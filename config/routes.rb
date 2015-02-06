Rails.application.routes.draw do
  
  root 'welcome#index'
  
  resources :posts do
    resources :comments
    resources :ratings
  end
  
  resources :categories

end
