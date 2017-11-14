class Item < ApplicationRecord
  belongs_to :stock
  belongs_to :shoppinglist

def add
  self.quantity_ordered +=1
  self.save
end

def subtract
  self.quantity_ordered -= 1
  self.save
  if self.quantity_ordered == 0
    return self.destroy
  end
end

end
