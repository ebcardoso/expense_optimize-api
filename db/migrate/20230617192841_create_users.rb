# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :token_password_recovery
      t.datetime :token_password_recovery_deadline
      t.string :token_password_confirmation
      t.datetime :token_password_confirmation_deadline
      t.references :company, null: false, foreign_key: true, type: :uuid
      t.string :username

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :email
    add_index :users, :password_digest
    add_index :users, :token_password_recovery
    add_index :users, :token_password_recovery_deadline
    add_index :users, :token_password_confirmation
    add_index :users, :token_password_confirmation_deadline
  end
end
