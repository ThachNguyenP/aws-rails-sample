Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/health_check', to: 'health_check#index'
  resources :home
end
