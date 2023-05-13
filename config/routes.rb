# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: redirect('/contacts')

  resources :contacts
end
