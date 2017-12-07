# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :twilio do
    namespace :callback do
      resource :outgoing_dial, only: :create
      resource :incoming_dial, only: :create
      resource :reservation_order, only: :create
      resource :reservation_order_confirm, only: :create
      resource :reservation_number, only: :create
      resource :reservation_number_confirm, only: :create
    end
  end
end
