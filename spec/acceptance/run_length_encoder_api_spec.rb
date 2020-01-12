# frozen_string_literal: true

require 'rack/test'
require 'json'

RSpec.describe 'Run Length Encoder API' do
  include Rack::Test::Methods

  def app
    API.new(converter: converter)
  end

  context 'encoding' do
    let(:converter) { Encoder }
    let(:decoded_text) { 'OOOOFFFFFFKBGGGEEEEEEE' }
    let(:encoded_text) { '4O6FKB3G7E' }

    before { post '/encode', decoded_text }

    xit 'encodes the text' do
      expect(last_response.body).to eq(encoded_text)
    end

    xit 'returns status 200' do
      expect(last_response.status).to eq(200)
    end
  end
end