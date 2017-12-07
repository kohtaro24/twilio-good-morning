# frozen_string_literal: true
module TwilioWrapper::TwimlBuilder
  class ReservationOrderConfirm < Base
    attr_reader :reservation
    def initialize(reservation)
      @reservation = reservation
    end

    def twiml
      Twilio::TwiML::VoiceResponse.new do |r|
        r.gather(input: 'speech', timeout: 3, language: 'ja-JP', action: twilio_callback_reservation_order_confirm_url(reservation: reservation)) do |g|
          g.say("#{resevation_speech_format}でよろしいですか？", language: 'ja-JP')
        end
      end.to_xml
    end

    private

    def resevation_speech_format
      reservation.strftime "%m月%d日 %H時%M分"
    end
  end
end
