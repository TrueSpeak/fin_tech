# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.1.0'
# gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'
# gem 'jbuilder', '~> 2.7'

# gems for project

gem 'autoprefixer-rails'
gem 'bootstrap', '~> 4.3.1'
gem 'coffee-rails'
gem 'devise'
gem 'jquery-rails'
gem 'mini_racer'
gem 'open-uri', '~> 0.1.0'
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'pry-rails'
gem 'rest-client', '~> 2.1.0 '
gem 'sidekiq', '~> 6.1.3'
gem 'slim-rails'
gem 'uglifier'
gem 'whenever', '~> 1.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  gem 'factory_bot_rails'
  gem 'faker', '~> 2.8'
  gem 'rspec-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'letter_opener'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rails-controller-testing'
  gem 'rubocop', '~> 1.10', require: false
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
