Rails.application.routes.draw do

  root to: 'pages#home'

  get '/home', to: 'pages#home'

  devise_for :admins, controllers: { registrations: 'admins/registrations', sessions: 'admins/sessions', invitations: 'admins/invitations' }
  devise_for :facilitators, controllers: { registrations: 'facilitators/registrations', sessions: 'facilitators/sessions', invitations: 'facilitators/invitations' }

  namespace :admin do

    root to: 'pages#home'

  end

  namespace :facilitator do

    root to: 'pages#home'

    resources :projects, only: [:index, :show, :new, :create, :edit, :update] do
      resources :sessions, only: [:new, :create, :edit, :update]
      resources :diagnostics, only: [:new, :create, :edit, :update]
    end

  end

end
