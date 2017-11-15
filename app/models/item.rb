class Item < ApplicationRecord
  belongs_to :stock
  belongs_to :shoppinglist
  accepts_nested_attributes_for :shoppinglist

def add
  self.quantity_ordered +=1
  self.save
end

def subtract
  if self.quantity_ordered > 1
  self.quantity_ordered -= 1
  self.save
end
end

end
