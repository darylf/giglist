Rails.application.routes.draw do
  devise_for :users
  resources :artists, except: :destroy
  resources :events, except: :destroy
  resources :venues, except: :destroy

  root 'events#index'
end
