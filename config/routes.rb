Rails.application.routes.draw do
  get 'schedules/index'
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meeting_rooms
  root to: "meeting_rooms#index"
  resources :schedules
end
