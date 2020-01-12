# frozen_string_literal: true

class EncodingError < StandardError; end

class Encoder
  ENCODING_PATTERN = /(.)\1+/.freeze

  def self.call(text)
    raise EncodingError unless text.is_a?(String)

    text.gsub(ENCODING_PATTERN) do |consecutive_section|
      "#{consecutive_section.length}#{consecutive_section[0]}"
    end
  end
end