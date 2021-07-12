Rails.application.routes.draw do
  resources :room_messages
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'video#landing'
  get '/videochat', to: 'video#index'
  get '/screenshare', to: 'video#screenshare'
  post '/name', to: 'video#name'
  post '/chat/send', to: 'video#chat'
  get '/roomchat/:id', to: 'video#roomchat'
  get '/endmeet/:id', to: 'video#endmeet'
  get '/private_call', to: 'video#private_call'
end
