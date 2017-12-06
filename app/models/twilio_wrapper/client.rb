# frozen_string_literal: true
require 'singleton'
class TwilioWrapper::Client
  include Singleton
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new(Settings.twilio.account_sid, Settings.twilio.auth_token)
  end

  def create_call(webhook_url, to, from)
    client.calls.create(
      url: webhook_url,
      to: Phonelib.parse(to, :jp).e164,
      from: Phonelib.parse(from, :jp).e164
    )
  end
end
