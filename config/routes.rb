Rails.application.routes.draw do

  # root to: 'admins/sessions#new'

  devise_for :admins, controllers: { registrations: 'admins/registrations', sessions: 'admins/sessions' }

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
