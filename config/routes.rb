Rails.application.routes.draw do
  devise_for :users
  root 'boards#index'
  resources :boards, only: %i(new index create show destroy)
  resources :list, only: %i(new create edit update destroy) do
    resources :card, except: %i(index)
  end
end
