# frozen_string_literal: true

class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones, id: :uuid do |t|
      t.integer :phone_type
      t.string :phone_number
      t.references :phoneble, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
    add_index :phones, :phone_type
    add_index :phones, :phone_number
  end
end
