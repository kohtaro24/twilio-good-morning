# frozen_string_literal: true
module TwilioWrapper::TwimlBuilder
  class ReservationOrder < Base
    def twiml
      Twilio::TwiML::VoiceResponse.new do |r|
        r.gather(input: 'speech', timeout: 3, language: 'ja-JP', action: twilio_callback_reservation_order_url) do |g|
          g.say('ご予約の時間を教えてください', language: 'ja-JP')
        end
      end.to_xml
    end
  end
end
