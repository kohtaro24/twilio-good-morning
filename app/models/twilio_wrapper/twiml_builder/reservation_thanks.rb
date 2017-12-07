# frozen_string_literal: true
module TwilioWrapper::TwimlBuilder
  class ReservationThanks < Base
    def twiml
      Twilio::TwiML::VoiceResponse.new do |r|
        r.say('ご予約を受け付けました。ありがとうございます。おやすみなさい。', language: 'ja-JP')
      end.to_xml
    end
  end
end
