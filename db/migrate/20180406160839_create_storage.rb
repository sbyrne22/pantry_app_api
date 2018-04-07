class CreateStorage < ActiveRecord::Migration[5.2]
  def change
    create_table :storages do |t|
      t.string :name
    end
  end
end
