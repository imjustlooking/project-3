class Shoppinglist < ApplicationRecord
  belongs_to :user
  has_many :items, inverse_of: :shoppinglist

  def calculate_total
    self.shoppinglist(params[:id]).items {|item| item.stock.price* item.quantity_ordered}.sum
  end


 def total_price
   @total_price  ||= items.includes(:shoppinglist).reduce(0) do |sum,item|
     sum + (item.stock.price * item.quantity_ordered)
    end
  end
 end
