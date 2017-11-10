class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :name_item
      t.string :barcode
      t.decimal :price
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
