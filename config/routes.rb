Rails.application.routes.draw do
  get 'home/index'
  draw :user
  draw :admin
end
