class Item < ApplicationRecord
  belongs_to :stock
  belongs_to :shoppinglist
end
