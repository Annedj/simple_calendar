Rails.application.routes.draw do
  resources :meetings
  devise_for :users
  root to: 'pages#home'
  get :monthly, to: 'calendars#monthly'
  get :weekly, to: 'calendars#weekly'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
