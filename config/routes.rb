DwellcandyCom::Application.routes.draw do
  root to: "staticpages#home"

  resources :users, only: [:new, :create]

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
