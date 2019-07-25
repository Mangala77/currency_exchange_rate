# frozen_string_literal: true

require_relative './exchange_rate/currency'
require_relative './exchange_rate/file_reader'

module CurrencyExchange
  def self.rate(date, from_currency, to_currency, base_currency)
    #  calculate and return rate
    ExchangeRate::Currency.new(date, from_currency, to_currency, base_currency).calculate
  end
end
