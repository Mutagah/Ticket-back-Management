Rails.application.routes.draw do
  resources :transactions
  
  namespace :api do
    resources :home_banners, only: [:index]
    resources :users, only: [:create, :destroy]
    resources :user_profiles
    resources :events
    resources :categories, only: [:index, :show]
    resources :communities, only: [:index, :create, :show, :destroy]
    resources :abouts, only: [:index, :create, :show, :destroy]
    resources :login_slides
    resources :tickets
    resources :user_attendeds
    post '/payment', to: 'payments#payment'
    post '/callback', to: 'payments#callback'
    get '/recent-payment/:id', to: 'payments#details'
    get '/transaction-info', to: 'payments#transaction_details'
  end

  post '/login', to: 'auth#create'
  post '/auto_login', to: 'auth#auto_login'
  get '/logged_in', to: 'application#logged_in?'
  get "/", to: "home_database#index"

end
