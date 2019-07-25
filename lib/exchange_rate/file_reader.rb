# frozen_string_literal: true

require 'json'

EURO_JSON_FILE = File.read('./data/eurofxref-hist-90d.json')
EURO_XML_FILE = '' # if xml file exist

USD_JSON_FILE = File.read('./data/eurofxref-hist-90d.json') ## consider USD currency for test

JPY_XML_FILE = ''

module ExchangeRate
  class FileReader
    def self.format(base_currency)
      case base_currency
      when 'EUR'
        parse_json_file(EURO_JSON_FILE)
      when 'USD'
        parse_json_file(USD_JSON_FILE)
      when 'JPY'
        parse_xml_file(JPY_XML_FILE)
      end
    end

    def self.parse_json_file(_file)
      JSON.parse(EURO_JSON_FILE)
    rescue JSON::ParserError => e
      p e
      raise ArgumentError, 'Invalid JSON file'
    end

    def self.parse_xml_file(file)
      ## parse xml file
    end
  end
end
