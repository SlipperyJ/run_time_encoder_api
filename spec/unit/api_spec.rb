# frozen_string_literal: true

require_relative '../../app/api'
require 'rack/test'

# rubocop:disable Metrics/BlockLength
RSpec.describe API do
  include Rack::Test::Methods

  def app
    API.new(converter: converter)
  end

  describe 'POST /encode' do
    let(:converter) { instance_double("Encoder") }

    context 'when the text is successfully encoded' do
      text_to_encode = 'text_to_encode'

      before do
        allow(converter).to receive(:call)
          .with(text_to_encode)
          .and_return('encoded_text')
      end

      it 'returns the encoded text' do
        post '/encode', text_to_encode

        expect(last_response.body).to eq('encoded_text')
      end

      it 'responds with 200 (OK)' do
        post '/encode', text_to_encode

        expect(last_response.status).to eq(200)
      end
    end

    context 'when the text fails validation' do
      text_to_encode = 'text_to_encode'

      before do
        allow(converter).to receive(:call)
          .with(text_to_encode)
          .and_raise(EncodingError, 'Text to encode is invalid')
      end

      it 'returns an error message' do
        post '/encode', text_to_encode

        expect(last_response.body).to eq('Text to encode is invalid')
      end
      it 'responds with a 422 (Unprocessable entity)' do
        post '/encode', text_to_encode

        expect(last_response.status).to eq(422)
      end
    end
  end
end