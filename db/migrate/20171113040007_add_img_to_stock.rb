class AddImgToStock < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :img, :string
  end
end
