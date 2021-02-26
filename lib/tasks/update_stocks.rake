# frozen_string_literal: true

namespace :stocks do
  desc 'Auto update stocks'

  task autoupdate: :environment do
    tickers = Stock.all.pluck(:ticker)
    tickers.each do |ticker|
      CnbcStocksParser.new(ticker).call
    end
  end
end
