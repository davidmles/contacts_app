# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: redirect('/contacts')

  resources :contacts, except: :show do
    get 'search', to: 'contacts#search', on: :collection, as: :search
  end
end
