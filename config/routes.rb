Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :boards, only: %i(new index create)
  resources :list, only: %i(new create edit update destroy) do
    resources :card, except: %i(index)
  end
end
