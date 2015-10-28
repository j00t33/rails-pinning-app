Rails.application.routes.draw do
  resources :users, except: [:index]

  get 'signup' => "users#new", as: :signup

  get 'login' => "users#login", as: 'login'
   
  post '/login' => "users#authenticate"

  root 'pins#index'

  get '/library' => 'pins#index'

  get "pins/name-:slug" => "pins#show_by_name", as: 'pin_by_name'

  resources :pins

end
