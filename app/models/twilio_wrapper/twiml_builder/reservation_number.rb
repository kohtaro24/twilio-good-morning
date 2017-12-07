# frozen_string_literal: true
module TwilioWrapper::TwimlBuilder
  class ReservationNumber < Base
    attr_reader :reservation
    def initialize(reservation)
      @reservation = reservation
    end

    def twiml
      Twilio::TwiML::VoiceResponse.new do |r|
        r.gather(input: 'speech', timeout: 5, language: 'ja-JP', action: twilio_callback_reservation_number_url(reservation: reservation)) do |g|
          g.say('お相手の電話番号を教えてください', language: 'ja-JP')
        end
      end.to_xml
    end
  end
end
