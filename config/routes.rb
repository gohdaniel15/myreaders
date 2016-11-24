Rails.application.routes.draw do

  devise_for :admins, controllers: { registrations: 'admins/registrations', sessions: 'admins/sessions', invitations: 'admins/invitations' }
  devise_for :facilitators, controllers: { registrations: 'facilitators/registrations', sessions: 'facilitators/sessions', invitations: 'facilitators/invitations' }

  root to: 'facilitator/pages#home'
  get '/home', to: 'pages#home'

  namespace :admin do
    root 'pages#home'
  end

  namespace :facilitator do
    root 'pages#home'
    resources :projects, only: [:index, :show, :new, :create, :edit, :update] do
      resources :sessions, only: [:new, :create, :edit, :update]
    end
  end

end
