# frozen_string_literal: true

class CreateOutflows < ActiveRecord::Migration[7.0]
  def change
    create_table :outflows do |t|
      t.decimal :value
      t.references :user, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
