# frozen_string_literal: true
module TwilioWrapper::TwimlBuilder
  class DialToConference < Base
    def twiml
      Twilio::TwiML::VoiceResponse.new do |r|
        r.dial do |d|
          d.conference 'hoge', startConferenceOnEnter: true, endConferenceOnExit: true
        end
      end.to_xml
    end
  end
end
