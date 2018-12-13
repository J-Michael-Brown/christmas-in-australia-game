Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/game' => 'game#index'
  get '/start' => 'game#start'
  get '/gamestart' => 'game#gamestart'

end
