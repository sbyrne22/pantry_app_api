class AddForeignKeyToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :storage_id, :integer
    add_column :foods, :container_id, :integer
  end
end
