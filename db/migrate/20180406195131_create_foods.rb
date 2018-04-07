class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.date :purchased_date
      t.date :experation_date
    end
  end
end
