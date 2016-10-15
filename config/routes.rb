Rails.application.routes.draw do

  devise_for :admins, controllers: { registrations: 'admins/registrations', sessions: 'admins/sessions', invitations: 'admins/invitations' }
  devise_for :facilitators, controllers: { registrations: 'facilitators/registrations', sessions: 'facilitators/sessions', invitations: 'facilitators/invitations' }
  root to: 'pages#home'

  get '/home', to: 'pages#home'
  get '/login/', to: 'pages#login'

  namespace :admin do
    root 'pages#home'
  end

  # namespace :facilitator do
  #
  #   resources :programs
  #   resources :training
  #
  # end

end
