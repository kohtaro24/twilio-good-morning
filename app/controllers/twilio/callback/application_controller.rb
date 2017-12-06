# frozen_string_literal: true
module Twilio::Callback
  class ApplicationController < ::ApplicationController
    skip_before_action :verify_authenticity_token
  end
end
