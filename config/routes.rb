Rails.application.routes.draw do
  resources :payments

  root :to => "home#index"
  draw :user
  draw :admin
end
