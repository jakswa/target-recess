Rails.application.routes.draw do
  namespace :teepee do
    resources :entities, only: :show
  end
  resources :sessions, except: %i[index show]
  root to: 'home#landing'
end
