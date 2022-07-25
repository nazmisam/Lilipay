Rails.application.routes.draw do

  root :to => "home#index"
  draw :user
  draw :admin
end
