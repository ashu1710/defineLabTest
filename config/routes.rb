Rails.application.routes.draw do
  devise_for :admins, :controllers => { passwords: 'admins/passwords', registrations: 'admins/registrations' }
  resources :authors, except: [:show]
  resources :books, except: [:show]
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
  	  resources :authors, only: [:show]
	end
  end  
  root to: "dashboard#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
