# frozen_string_literal: true

env :PATH, ENV['PATH']
env :GEM_PATH, '/usr/local/bundle'
ENV.each { |k, v| env(k, v) }

# Initial whenever for writing and deploying cron workers
#
set :output, { error: 'log/cron-error.log', standard: 'log/cron.log' }
# bundle exec whenever --update-crontab --set 'environment=development'
# bundle exec whenever --update-crontab --set 'environment=production'

# Отправить оповещение ежедневно в 23:00 по москве или в 20:00 по UTC
every 1.minute do
  StockAutoUpdateWorker.perform_async
end
