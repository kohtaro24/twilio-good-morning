# frozen_string_literal: true
module TwilioWrapper::SpeechParser
  class ReservationOrder
    attr_reader :speech_result
    def initialize(speech_result)
      @speech_result = speech_result
    end

    def parse
      "#{date.year}-#{date.month}-#{date.day} #{hour}:#{minute}".in_time_zone
    end

    private

    def hour
      hour = speech_result.scan(/([0-9]|1[0-9]|2[0-4])時/).flatten.first
      hour.present? ? hour : Time.current.hour
    end

    def minute
      minute = speech_result.scan(/([0-9]|[1-5][0-9])分/).flatten.first
      return minute if minute.present?
      speech_result.scan(/(半)/).present? ? 30 : 0
    end

    def date
      speech_result.scan(/(明日)/).present? ? Time.zone.tomorrow : Time.zone.today
    end
  end
end
