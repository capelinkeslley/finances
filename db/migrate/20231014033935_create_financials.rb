# frozen_string_literal: true

class CreateFinancials < ActiveRecord::Migration[7.0]
  def change
    create_table :financials do |t|
      t.string :month
      t.string :year
      t.decimal :value, precision: 10, scale: 2
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
