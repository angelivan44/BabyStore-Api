class CreateBuyables < ActiveRecord::Migration[6.0]
  def change
    create_table :buyables do |t|
      t.references :user, null: false, foreign_key: true
      t.references :clothe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
