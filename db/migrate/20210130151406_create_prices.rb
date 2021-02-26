# frozen_string_literal: true

class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.references :stock, null: false, foreign_key: true
      t.string :value, null: false
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
