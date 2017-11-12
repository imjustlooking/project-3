class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)

    @item.save
    redirect_to @item
  end
  def show
    @new_item = Item.new
  end

  private

  def item_params
    params.require[:item].permit(:stock_id, :quantity_ordered, :shoppinglist_id)
  end
end
