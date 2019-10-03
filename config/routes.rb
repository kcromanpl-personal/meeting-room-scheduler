Rails.application.routes.draw do
  
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  root to: "meeting_rooms#index"

  resources :meeting_rooms do
    resources :schedules
  end

  get "list_schedules", to: "schedules#list_schedules"
end
