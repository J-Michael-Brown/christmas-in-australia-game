Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :players do
    resources :objectives
  end

  resources :objectives do
    resources :locations
  end

  resources :locations do
    resources :items
    resources :options
  end


  resources :options do
    resources :locations
  end




  root 'home#index'
  get '/game' => 'game#index'
  get '/start' => 'game#start'
  get '/gamestart' => 'game#gamestart'
  get '/bed' => 'game#bed_logic'
  get '/scene1' => 'game#start_scene_1'
  get '/scene1_game' => 'game#scene1_game'
  get '/scene2' => 'game#start_scene_2'
  get '/scene2_game' => 'game#scene2_game'
  get '/scene3' => 'game#start_scene_3'
  get '/scene3_game' => 'game#scene3_game'

end
