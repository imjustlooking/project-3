class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :name_item
      t.integer :barcode
      t.decimal :price
      t.integer :quantity
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
