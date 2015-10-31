Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers # user authentication gem, predefines method to give us
  # current user logged in
  resources :trainers
  patch 'capture', to: 'pokemons#capture', as: 'capture' # part 2
  patch 'damage', to: 'pokemons#damage', as: 'damage'
 # get 'pokemon/new', to: 'pokemons#new'
#   post 'pokemon/create', to: 'pokemons#create'
  resource :pokemon
end
