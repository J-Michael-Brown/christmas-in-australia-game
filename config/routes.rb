Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/game' => 'game#index'
  get '/start' => 'game#start'
  get '/gamestart' => 'game#gamestart'
  get '/bed' => 'game#bed_logic'
  get '/area1' => 'game#start_area_1'
  get '/area1_game' => 'game#area1_game'
  get '/area2' => 'game#start_area_2'
  get '/area2_game' => 'game#area2_game'

end
