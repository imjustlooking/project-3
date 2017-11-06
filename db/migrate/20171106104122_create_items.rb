class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :stock, foreign_key: true
      t.integer :quantity_ordered
      t.references :shoppinglist, foreign_key: true

      t.timestamps
    end
  end
end
