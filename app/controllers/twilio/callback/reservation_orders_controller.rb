# frozen_string_literal: true
module Twilio::Callback
  class ReservationOrdersController < ApplicationController
    def create
       reservation = TwilioWrapper::SpeechParser::ReservationOrder.new(params[:SpeechResult]).parse
       render xml: TwilioWrapper::TwimlBuilder::ReservationOrderConfirm.new(reservation).twiml
    end
  end
end
