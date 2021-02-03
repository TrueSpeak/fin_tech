class CnbcStocksParser
  attr_reader :ticker, :stock_values, :current_price

  def initialize(ticker)
    if Rails.env.include?('development') || Rails.env.include?('production')
      doc = Nokogiri::HTML(RestClient.get("https://www.cnbc.com/quotes/#{ticker}"))
    else
      doc = Nokogiri::HTML(File.open("spec/files/#{ticker}.html"))
    end
    @ticker = ticker
    @stock_values = doc.search("li.Summary-stat")
    @current_price = doc.search("span.QuoteStrip-lastPrice")[0].children.text
  end

  def call
    update_price if Stock.exists?(ticker: ticker)
    save_or_raise_exception(new_stock)
  end

  private

  def new_stock
    Stock.new(
      ticker: ticker,
      open: stock_values[0].children[1].children.text,
      day_high: stock_values[1].children[1].children.text,
      day_low: stock_values[2].children[1].children.text,
      prev_close: stock_values[3].children[1].children.text,
      market_capitalization: stock_values[8].children[1].children.text,
      size: stock_values[9].children[1].children.text,
      dividends: stock_values[11].children[1].children.text,
      change_per_year: stock_values[14].children[1].children.text,
    )
  end

  def update_price
    Stock.find_by(ticker: ticker).prices.last.update(value: current_price, completed: true)
  end

  def save_or_raise_exception(new_stock)
    if new_stock.valid?
      ActiveRecord::Base.transaction do
        new_stock.save
        new_stock.prices.create(value: current_price)
      end
    else
      raise ActiveModel::ValidationError
    end
  end
end
