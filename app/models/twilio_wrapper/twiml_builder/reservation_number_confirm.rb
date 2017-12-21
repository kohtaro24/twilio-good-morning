# frozen_string_literal: true
module TwilioWrapper::TwimlBuilder
  class ReservationNumberConfirm < Base
    attr_reader :reservation
    attr_reader :number
    def initialize(reservation, number)
      @reservation = reservation
      @number = number
    end

    def twiml
      Twilio::TwiML::VoiceResponse.new do |r|
        r.gather(input: 'speech', timeout: 3, language: 'ja-JP', action: twilio_callback_reservation_number_confirm_url(reservation: reservation, number: number)) do |g|
          g.say("#{number.chars.join(',')}でよろしいですか？", language: 'ja-JP', hints: Settings.twilio.speech_hints.accept.join(','))
        end
      end.to_xml
    end
  end
end
