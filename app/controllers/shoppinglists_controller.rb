class ShoppinglistsController < ApplicationController
  def index
    @new_shoppinglist = Shoppinglist.new
    @shoplists = current_user.shoppinglists
  end

  def show
    @shoppinglist = Shoppinglist.find(params[:id])
    @shoppinglist_items = @shoppinglist.items.order('id desc')
    @amount = @shoppinglist.total_price*100.to_i

  end
  def create
    @new_shoppinglist = current_user.shoppinglists.create(params.require(:shoppinglist).permit(:name_shoppinglist))
    flash[:info] = @new_shoppinglist.name_shoppinglist + " created. Fill up your shopping list!"
    redirect_to stocks_path

    # render :json => current_user.shoppinglists
  end

  def new
    @new_shoppinglist = Shoppinglist.new
  end

  def edit
    @shoppinglist = Shoppinglist.find(params[:id])
  end

  def update
    @shoppinglist = Shoppinglist.find(params[:id])
    if @shoppinglist.update(params.require(:shoppinglist).permit(:name_shoppinglist, :paid_on))
      flash[:alert]="Shopping List Updated"
      redirect_to action: "index"
    else
      flash[:alert]="Shopping list cannot update"
      render 'edit'
    end
  end

  def history
    @shoplists =  current_user.shoppinglists
  end

  def duplicate
    new_shoppinglist = current_user.shoppinglists.create(params.permit(:name_shoppinglist))
    items = Item.where(shoppinglist_id: params[:oldListId])
    for item in items do
        new_item =Item.new
        new_item.stock_id = item.stock_id
        new_item.quantity_ordered = item.quantity_ordered
        new_item.shoppinglist_id = new_shoppinglist.id
        new_item.save
    end
    flash[:info]="list is duplicated"
    redirect_back(fallback_location: root_path)
  end

  def paid
    shoppinglist = Shoppinglist.find(params[:id]).order
    shoppinglist.update(params.require(:paid_on).permit(:paid_on))
  end

  def destroy
    Shoppinglist.destroy(params[:id])
    redirect_to action: "index"
  end
  def item_params
    params.require(:item).permit(:stock_id, :quantity_ordered, :shoppinglists_id)
  end
end
