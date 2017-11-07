class Item < ApplicationRecord
  belongs_to :stock_id
  belongs_to :shoppinglist_id
end
