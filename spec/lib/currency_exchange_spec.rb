# frozen_string_literal: true

require_relative '../../lib/currency_exchange.rb'

describe CurrencyExchange do
  describe '.rate' do
    context 'base currency is EUR' do
      context 'from and to currency is EUR' do
        it 'should return 1' do
          result = described_class.rate(Date.new(2018, 12, 11), 'EUR', 'EUR', 'EUR')
          expect(result).to eq(1)
        end
      end

      context 'to currency is EUR' do
        it 'should return correct_rate' do
          correct_rate = 0.007766990291262136
          result = described_class.rate(Date.new(2018, 12, 11), 'JPY', 'EUR', 'EUR')
          expect(result).to eq(correct_rate)
        end
      end

      context 'from currency is EUR' do
        it 'should return correct_rate' do
          correct_rate = 128.75
          result = described_class.rate(Date.new(2018, 12, 11), 'EUR', 'JPY', 'EUR')
          expect(result).to eq(correct_rate)
        end
      end

      context 'when from and to currency is not EUR' do
        it 'should return correct_rate' do
          correct_rate = 0.008838058252427184
          result = described_class.rate(Date.new(2018, 12, 11), 'USD', 'JPY', 'EUR')
          expect(result).to eq(correct_rate)
        end
      end

      context 'Date is incorrect' do
        xit 'should raise an error' do
          result = described_class.rate(Date.new(2019, 12, 11), 'USD', 'JPY', 'EUR')
          expect { result }.to raise_error('Date is invalid')
        end
      end
    end

    ## in future if base currency changes to differet currency other than EURO

    context 'base currency not EURO' do
      context 'from and to currency is USD' do
        it 'should return 1' do
          result = described_class.rate(Date.new(2018, 12, 11), 'USD', 'USD', 'USD')
          expect(result).to eq(1)
        end
      end

      context 'to currency is USD' do
        it 'should return correct_rate' do
          correct_rate = 0.007766990291262136
          result = described_class.rate(Date.new(2018, 12, 11), 'JPY', 'USD', 'USD')
          expect(result).to eq(correct_rate)
        end
      end
    end
  end
end
