class ItemsController < ApplicationController
  def create
    @item = Item.create(item_params)
    if @item.save
      flash[:success] = 'Your item has been added.'
      redirect_to stocks_path
    else
      flash[:danger] = 'Boo'
      # you guys can change the alert tag accordingly: https://getbootstrap.com/docs/4.0/components/alerts/
      redirect_to stocks_path
    end
  end

  def show
    @new_item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:stock_id, :quantity_ordered, :shoppinglist_id)
  end
end
