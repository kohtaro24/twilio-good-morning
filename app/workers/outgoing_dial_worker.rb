# frozen_string_literal: true
class OutgoingDialWorker < ApplicationWorker
  include Rails.application.routes.url_helpers

  def perform(numbers = [])
    client = TwilioWrapper::Client.instance
    numbers.each do |number|
      client.create_call(twilio_callback_outgoing_dial_url, number, Settings.twilio.caller_id)
    end
  end
end
