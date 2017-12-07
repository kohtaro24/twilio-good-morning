# frozen_string_literal: true
module Twilio::Callback
  class IncomingDialsController < ApplicationController
    def create
      render xml: TwilioWrapper::TwimlBuilder::ReservationOrder.new.twiml
    end
  end
end
