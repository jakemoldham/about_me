Rails.application.routes.draw do

  root 'static_pages#home'

  # For redirect to work must be before devise_for :users.
  get '/users/sign_up', to: redirect('/users/sign_in')
  devise_for :users
  

  get '/about', to: 'static_pages#about', as: :about
  get  'static_pages/contact'

  get 'contact', to: 'contacts#new', as: 'contact'
  post 'contact', to: 'contacts#create'

  post 'contact/create', to: 'contact#create', as: :send_contact_mailer_path

  resources :vims

  namespace :to_live do
    resources :questions
    resources :stages
    resources :answers
    resources :players
    get '/lives', to: 'stages#lives', as: :lives
    get '/game', to: 'stages#game', as: :game
  end
end
