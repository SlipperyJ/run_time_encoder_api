# frozen_string_literal: true

require 'rack/test'
require 'json'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Run Length Encoder API' do
  include Rack::Test::Methods

  def app
    API.new(converter: converter)
  end

  let(:decoded_text) { 'OOOOFFFFFFKBGGGEEEEEEE' }
  let(:encoded_text) { '4O6FKB3G7E' }

  context 'encoding' do
    let(:converter) { Encoder }
    before { post '/encode', decoded_text }

    it 'encodes the text' do
      expect(last_response.body).to eq(encoded_text)
    end

    it 'returns status 200' do
      expect(last_response.status).to eq(200)
    end
  end

  context 'decoding' do
    let(:converter) { Decoder }

    before { post '/decode', encoded_text }

    it 'decodes the text' do
      expect(last_response.body).to eq(decoded_text)
    end

    it 'returns status 200' do
      expect(last_response.status).to eq(200)
    end
  end
end
# rubocop:enable Metrics/BlockLength
