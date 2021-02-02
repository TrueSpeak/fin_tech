require 'rails_helper'

RSpec.describe CnbcStocksParser do
  subject(:parser) { described_class.new('AAPL') }

  it 'entity creation check' do
    expect(Stock.all.blank?).to be_truthy
    expect(Price.all.blank?).to be_truthy
    parser.call
    expect(Stock.all.blank?).to be_falsey
    expect(Price.all.blank?).to be_falsey
  end

  context 'when created' do
    let(:stock_values) do
      {
        ticker: 'AAPL',
        open: '135.83',
        day_high: '136.74',
        day_low: '130.21',
        prev_close: '137.09',
        market_capitalization: '2,219,997.47M',
        size: '16,823.26M',
        dividends: '0.82',
        change_per_year: '62.98'
      }
    end

    let(:price_values) do
      {
        value: '131.79',
        completed: false
      }
    end

    before { parser.call }

    it 'stock with parsed attributes' do
      expect(Stock.last.attributes.except('id', 'created_at', 'updated_at')).to eq(stock_values.stringify_keys)
    end

    it 'price with parsed attributes' do
      expect(Price.last.attributes.except('id', 'created_at', 'updated_at')).
        to eq(price_values.merge(stock_id: Stock.last.id).stringify_keys)
    end
  end

  context 'when entity created and parser update attributes' do
    let!(:stock_for_update) { create(:stock, ticker: 'AAPL') }
    let!(:price_for_stock) { create(:price, stock: stock_for_update) }

    before { parser.call }

    it 'try to update AAPL stock' do
      expect(Stock.last.updated_at).to_not eq(stock_for_update.updated_at)
    end
  end
end