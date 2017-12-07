# frozen_string_literal: true
module TwilioWrapper::TwimlBuilder
  class Base
    include Rails.application.routes.url_helpers
    
    def twiml
      raise NotImplementedError
    end
  end
end
