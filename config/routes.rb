# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      registration: 'registration'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    },
    skip: %i[invitations confirmations password registration session]
    as :user do
      post   'login'               => 'sessions#create',              as: 'user_session'
      delete 'logout'              => 'sessions#destroy',             as: 'destroy_user_session'
      post   'registration'        => 'registrations#create',         as: 'create_user_registration'
      put    'registration'        => 'registrations#update',         as: 'update_user_registration'
      delete 'registration'        => 'registrations#destroy',        as: 'destroy_user_registration'
      delete 'registration/avatar' => 'registrations#destroy_avatar', as: 'destroy_user_avatar'
      put    'password'            => 'devise/passwords#update',      as: 'update_user_password'
    end

  namespace :v1 do
    resources :users, only: %i[index show] do
      get :avatar, on: :member
    end
  end
end
