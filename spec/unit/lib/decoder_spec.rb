# frozen_string_literal: true

require_relative '../../../lib/decoder'

# rubocop:disable Metrics/BlockLength
RSpec.describe Decoder do
  describe '#decode' do
    context 'when the text to decode is valid' do
      let(:text_to_decode) { '6F3RF' }

      it 'decodes the text' do
        expect(described_class.call(text_to_decode)).to eq('FFFFFFRRRF')
      end
    end

    context 'when the text to decode is empty' do
      let(:text_to_decode) { '' }

      it 'does not modify the text' do
        expect(described_class.call(text_to_decode)).to eq('')
      end
    end

    context 'when the text to decode is invalid' do
      let(:text_to_decode) { :wrong_datatype }

      it 'returns an error' do
        expect { described_class.call(text_to_decode) }
          .to raise_error(DecodingError)
      end
    end

    context 'when the text to decode is nil' do
      let(:text_to_decode) { nil }

      it 'returns an error' do
        expect { described_class.call(text_to_decode) }
          .to raise_error(DecodingError)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
