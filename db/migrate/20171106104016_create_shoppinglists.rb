class CreateShoppinglists < ActiveRecord::Migration[5.1]
  def change
    create_table :shoppinglists do |t|
      t.references :user, foreign_key: true
      t.datetime :paid_on

      t.timestamps
    end
  end
end
