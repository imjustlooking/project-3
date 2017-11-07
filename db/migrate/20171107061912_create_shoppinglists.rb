class CreateShoppinglists < ActiveRecord::Migration[5.1]
  def change
    create_table :shoppinglists do |t|
      t.string :name_shoppinglist
      t.datetime :paid_on
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
