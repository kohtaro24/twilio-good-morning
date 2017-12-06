# frozen_string_literal: true
module Twilio::Callback
  class OutgoingDialsController < ApplicationController
    def create
      render xml: TwilioWrapper::TwimlBuilder::DialToConference.new.twiml
    end
  end
end
