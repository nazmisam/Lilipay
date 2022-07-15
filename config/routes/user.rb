devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations',
  confirmations: 'users/confirmations'
}

devise_scope :user do
  authenticated :user do
    root 'users/home#index', as: :authenticated_user_root
  end

  unauthenticated :user do
    root 'users/sessions#new', as: :unauthenticated_user_root
  end
end

namespace :users, as: :user do

end