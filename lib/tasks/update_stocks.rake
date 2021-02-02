namespace :stocks do
  desc 'Auto update stocks'

  task autoupdate: :environment do
    tickers = Stock.all.pluck(:ticker)
    tickers.each do |ticker|
      CnbcStocksParser.new(ticker)
    end
  end
end
