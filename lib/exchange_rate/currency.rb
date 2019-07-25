# frozen_string_literal: true

require 'date'
module ExchangeRate
  class Currency
    def initialize(date, from_currency, to_currency, base_currency)
      self.date = date
      self.from_currency = from_currency
      self.to_currency = to_currency
      self.base_currency = base_currency
    end

    def calculate
      if from_currency == base_currency
        return 1 if to_currency == base_currency

        rate_to_currency.to_f
      else
        exchange_rate
      end
    end

    private

    def exchange_rate
      if to_currency == base_currency
        base_exchange_rate
      else
        non_base_exchange_rate
      end
    end

    def base_exchange_rate
      1.0 / rate_from_currency # convert to EUR
    end

    def non_base_exchange_rate
      rate_from_currency / rate_to_currency
    end

    def rates
      rates ||= file_reader
      dt = date.strftime('%Y-%m-%d')
      raise ArgumentError, 'Date is Invalid' if rates[dt].nil?

      rates[dt]
    end

    def file_reader
      ExchangeRate::FileReader.format(base_currency)
    end

    def rate_from_currency
      raise ArgumentError, "Rates Not available for currency #{from_currency}" if rates[from_currency].nil?

      rates[from_currency]
    end

    def rate_to_currency
      raise ArgumentError, "Rates Not available for currency #{to_currency}" if rates[to_currency].nil?

      rates[to_currency]
    end

    attr_accessor :date, :from_currency, :to_currency, :base_currency
  end
end
