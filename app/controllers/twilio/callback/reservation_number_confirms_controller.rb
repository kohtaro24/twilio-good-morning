# frozen_string_literal: true
module Twilio::Callback
  class ReservationNumberConfirmsController < ApplicationController
    def create
        if %w(へい はい あい うん).any? { |word| params[:SpeechResult].tr('ァ-ン', 'ぁ-ん').include?(word) }
          reserve(params[:reservation].in_time_zone, [params[:Caller], params[:number]])
          render xml: TwilioWrapper::TwimlBuilder::ReservationThanks.new.twiml
        else
          render xml: TwilioWrapper::TwimlBuilder::ReservationNumber.new(params[:reservation]).twiml
        end
    end

    private

    def reserve(reservation, numbers)
      OutgoingDialWorker.perform_at(reservation, numbers)
    end
  end
end
