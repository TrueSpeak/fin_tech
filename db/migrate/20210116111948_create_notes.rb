# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.boolean :private_note, default: false

      t.timestamps
    end

    add_reference :notes, :user, index: true
  end
end
