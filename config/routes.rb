Rails.application.routes.draw do

  devise_for :admins, controllers: { registrations: 'admins/registrations', sessions: 'admins/sessions' }
  devise_for :facilitators, controllers: { registrations: 'facilitators/registrations', sessions: 'facilitators/sessions' }
  root to: 'pages#home'

  get '/home', to: 'pages#home'

  # namespace :admin do
  # end

  # namespace :facilitator do
  #
  #   resources :programs
  #   resources :training
  #
  # end

end
