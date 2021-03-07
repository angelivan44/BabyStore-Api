class CreateWantables < ActiveRecord::Migration[6.0]
  def change
    create_table :wantables do |t|
      t.references :user, null: false, foreign_key: true
      t.references :clothe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
