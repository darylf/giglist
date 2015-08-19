Rails.application.routes.draw do
  root 'events#index'
  resources :artists, except: :destroy
  resources :events, except: :destroy
  resources :venues, except: :destroy
end
