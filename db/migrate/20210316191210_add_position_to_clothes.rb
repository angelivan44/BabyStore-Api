class AddPositionToClothes < ActiveRecord::Migration[6.0]
  def change
    add_column :clothes, :position, :integer
    add_column :clothes, :status, :string
  end
end
