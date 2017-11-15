class ItemsController < ApplicationController
  def create
    if params[:item][:shoppinglists].present?
      # create the shopping list first
      shoppinglist = Shoppinglist.create(
        name_shoppinglist: params[:item][:shoppinglists][:name_shoppinglist],
        user_id: current_user.id
      )
    else
      shoppinglist = Shoppinglist.find(params[:item][:shoppinglist_id])
    end

    # render json: params
    @item = Item.new(item_params)
    @item.shoppinglist_id = shoppinglist.id
    if @item.save
      flash[:success] = @item.quantity_ordered.to_s + ' unit(s) of ' + @item.stock.name_item + ' has been added to "' + @item.shoppinglist.name_shoppinglist + '".'
      redirect_to stocks_path
    else
      render json: {
        shoppinglist: shoppinglist,
        errors: @item.errors.messages
      }
      # flash[:danger] = 'Item add failed. Please check if you have selected a valid shopping list.'
      # you guys can change the alert tag accordingly: https://getbootstrap.com/docs/4.0/components/alerts/
      # redirect_to stocks_path
    end
  end

  def edit
    @update_item = Item.find(params[:id])
  end

  def update
    @update_item = Item.find(params[:id])
    @update_item.update(params.permit(:quantity_ordered))

    if params[:operation] == "add"
      #increasing ordering quantity by 1
      @update_item.add
      # flash[:success] = "updated " + @update_item.quantity_ordered.to_s + "of " + @item.stock.name_item
    elsif params[:operation] == "minus" && @update_item.quantity_ordered>0
      #decreasing ordering quantity by 1
      @update_item.subtract
    else
      flash[:danger] = 'Cannot change quantity of item'
    end
      redirect_back(fallback_location: root_path)
  end

  def show
    @new_item = Item.new
  end

  def destroy
    Item.destroy(params[:id])
    redirect_back(fallback_location: root_path)
  end

  private

  def item_params
    params.require(:item).permit(:stock_id, :quantity_ordered, shoppinglists_attributes: [:name_shoppinglist])
  end
end
