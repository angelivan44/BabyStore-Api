class AddOldpriceToClothes < ActiveRecord::Migration[6.0]
  def change
    add_column :clothes, :oldprice, :decimal
  end
end
