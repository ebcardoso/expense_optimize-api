class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :profile, type: :uuid, null: false, foreign_key: true
      t.timestamps
    end
  end
end