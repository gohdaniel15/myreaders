Rails.application.routes.draw do

  devise_for :admins, controllers: { registrations: 'admins/registrations', sessions: 'admins/sessions' }
  devise_for :facilitators, controllers: { registrations: 'admins/registrations', sessions: 'admins/sessions' }
  # root to: 'admins/sessions#new'

  # devise_for :facilitator

  # namespace :admin do
  # end

  # namespace :facilitator do
  #
  #   resources :programs
  #   resources :training
  #
  # end

end
