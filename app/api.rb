# frozen_string_literal: true

require 'sinatra/base'
require 'json'

class API < Sinatra::Base
  def initialize(converter:)
    @converter = converter
  end

  post '/encode' do
    text_to_encode = request.body.read

    result = @converter.call(text_to_encode)

    [200, {}, [result]]

  rescue EncodingError
    [422, {}, ['Text to encode is invalid']]
  end
end
