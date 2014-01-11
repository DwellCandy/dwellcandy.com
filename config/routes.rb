DwellcandyCom::Application.routes.draw do
  # comfy_route :cms_admin, :path => '/admin'

  root to: "staticpages#home"

  resources :users, only: [:new, :create, :show] do
    resources :jobs, only: [:create, :show] do
    end
    # member do
    #   get 'new_job'
    #   post 'job'
    # end
  end

  resources :sessions, only: [:create, :destroy]

  get 'login', to: 'staticpages#login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  # Make sure this routeset is defined last
  # comfy_route :cms, :path => '/', :sitemap => false
end
