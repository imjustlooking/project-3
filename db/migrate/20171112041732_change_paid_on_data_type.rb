class ChangePaidOnDataType < ActiveRecord::Migration[5.1]
  def change
    change_column :shoppinglists, :paid_on, :string
  end
end
