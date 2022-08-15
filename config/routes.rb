Rails.application.routes.draw do
  root :to => "users/home#index"
  draw :user
  draw :admin
end
