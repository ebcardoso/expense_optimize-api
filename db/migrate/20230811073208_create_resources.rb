class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources, id: :uuid do |t|
      t.bigint :kind
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end