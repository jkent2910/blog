Rails.application.routes.draw do
  
  devise_for :admins
  root 'welcome#index'
  
  get '/course' => 'pages#course'
  get '/story' => 'pages#story'
  
  resources :posts do
    resources :comments
    resources :ratings
  end
  
  resources :categories

end
