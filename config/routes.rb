Rails.application.routes.draw do
  resources :sessions, except: %i[index show]
  root to: 'home#landing'
end
