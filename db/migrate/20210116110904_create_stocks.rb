class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :ticker, null: false
      t.string :open, null: false
      t.string :day_high, null: false
      t.string :day_low, null: false
      t.string :prev_close, null: false
      t.string :market_capitalization, null: false
      t.string :size, null: false
      t.string :dividends, null: false
      t.string :change_per_year, null: false

      t.timestamps
    end
  end
end
