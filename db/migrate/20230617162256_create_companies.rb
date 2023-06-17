# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :document
      t.string :legal_name
      t.string :trade_name

      t.timestamps
    end
    add_index :companies, :document
    add_index :companies, :legal_name
    add_index :companies, :trade_name
  end
end
