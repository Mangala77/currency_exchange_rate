# frozen_string_literal: true

source 'https://rubygems.org'

gem 'test-unit'

# Ruby 2.6.x requires the `irb` gem to be in the Gemfile
gem 'irb' if defined?(RUBY_VERSION) && RUBY_VERSION.to_f >= 2.6
gem 'rubocop'
gem 'yard'

group :development, :test do
  gem 'rspec-rails', '~> 3.8'
end
