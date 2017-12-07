# frozen_string_literal: true
module Twilio::Callback
  class ReservationNumbersController < ApplicationController
    def create
      number = params[:SpeechResult].gsub(/[^\d]/, '')
      render xml: TwilioWrapper::TwimlBuilder::ReservationNumberConfirm.new(params[:reservation], number).twiml
    end
  end
end
