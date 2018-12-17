Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :players do
    resources :objectives
    resources :locations
    resources :items
  end

  resources :objectives do
    resources :locations
  end

  resources :locations do
    resources :items
  end
  
  root 'home#index'
  get '/game' => 'game#index'
end
