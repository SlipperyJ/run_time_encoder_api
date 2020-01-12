# frozen_string_literal: true

class DecodingError < StandardError; end

class Decoder
  DECODING_PATTERN = /(\d+)(.)/.freeze

  def self.call(text)
    raise DecodingError unless text.is_a?(String)

    text.gsub(DECODING_PATTERN) do
      Regexp.last_match(2) * Regexp.last_match(1).to_i
    end
  end
end
