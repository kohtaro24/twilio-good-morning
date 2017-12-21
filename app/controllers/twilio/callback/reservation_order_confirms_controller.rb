# frozen_string_literal: true
module Twilio::Callback
  class ReservationOrderConfirmsController < ApplicationController
    def create
        if Settings.twilio.speech_hints.accept.any? { |word| params[:SpeechResult].tr('ァ-ン', 'ぁ-ん').include?(word) }
          render xml: TwilioWrapper::TwimlBuilder::ReservationNumber.new(params[:reservation]).twiml
        else
          render xml: TwilioWrapper::TwimlBuilder::ReservationOrder.new.twiml
        end
    end
  end
end
