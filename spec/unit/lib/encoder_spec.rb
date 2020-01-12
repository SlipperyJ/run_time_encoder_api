# frozen_string_literal: true

require_relative '../../../lib/encoder'

RSpec.describe Encoder do
  describe '#encode' do
    context 'when the text to encode is valid' do
      let(:text_to_encode) { 'OOOOFFFFFFKBGGGEEEEEEE' }

      it 'encodes the text' do
        expect(described_class.call(text_to_encode)).to eq('4O6FKB3G7E')
      end
    end

    context 'when the text to encode is invalid' do
      let(:text_to_encode) { :wrong_datatype }

      it 'returns an error' do
        expect { described_class.call(text_to_encode) }
          .to raise_error(EncodingError)
      end
    end

    context 'when the text to encode is nil' do
      let(:text_to_encode) { nil }

      it 'returns an error' do
        expect { described_class.call(text_to_encode) }
          .to raise_error(EncodingError)
      end
    end
  end
end
