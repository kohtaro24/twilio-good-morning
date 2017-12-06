Rails.application.routes.draw do
  namespace :twilio do
    namespace :callback do
      resource :outgoing_dial, only: :create
    end
  end
end
