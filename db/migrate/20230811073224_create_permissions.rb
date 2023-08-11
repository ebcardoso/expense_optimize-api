class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.references :resource, type: :uuid, null: false, foreign_key: true
      t.references :profile, type: :uuid, null: false, foreign_key: true
      t.boolean :read, default: false
      t.boolean :create, default: false
      t.boolean :edit, default: false
      t.boolean :exclude, default: false
      t.timestamps
    end
  end
end
