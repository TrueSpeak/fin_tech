class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :type, default: '', null: false
      t.integer :dividends, default: 0, null: false
      t.integer :size, default: 0, null: false
      t.integer :change_per_year, default: 0, null: false
      t.integer :market_capitalization, default: 0, null: false

      t.timestamps
    end
  end
end
