# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: redirect('/contacts')

  resources :contacts do
    get 'search', to: 'contacts#search', on: :collection, as: :search
  end
end
