class StockAutoUpdateWorker
  include Sidekiq::Worker

  def perform
    rake 'stocks:autoupdate'
  end
end