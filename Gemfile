source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.1.0'
# gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
# gem 'jbuilder', '~> 2.7'

# gems for project

gem 'slim-rails'
gem 'bootstrap', '~> 4.3.1'
gem 'autoprefixer-rails'
gem 'mini_racer'
gem 'devise'
gem 'open-uri', '~> 0.1.0'
gem 'rest-client', '~> 2.1'
gem 'jquery-rails'
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'uglifier'
gem 'coffee-rails'
gem 'pry-rails'
#doc.css('body div.wrapper').css('section#leftColumn').at('div.clear.overviewDataTable.overviewDataTableWithTooltip').at('div.first.inlineblock').at('span.float_lang_base_2.bold').children.text
#doc.search('td.symbol.left.bold.elp').at('a').attributes['href'].value
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'faker', '~> 2.8'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'letter_opener'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
