Rails.application.routes.draw do
  get 'login' => 'session#login'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  post 'delete_user' => 'users#delete_user_with_user_name'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
