Rails.application.routes.draw do
  resources :activities, except: [:create]
  resources :campers, except: [:update, :delete]
  resources :signups, except: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
