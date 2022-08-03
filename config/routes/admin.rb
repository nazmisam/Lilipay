devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  registrations: 'admins/registrations',
  confirmations: 'admins/confirmations'
}

devise_scope :admin do
  authenticated :admin do
    root 'admins/home#index', as: :authenticated_admin_root
  end

  unauthenticated :admin do
    root 'admins/sessions#new', as: :unauthenticated_admin_root
  end
end

namespace :admins, as: :admin do

  root :to => "home#index"
  resources :escrows
  resources :paymentreleases

end
