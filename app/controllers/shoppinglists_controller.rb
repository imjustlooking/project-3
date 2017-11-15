class ShoppinglistsController < ApplicationController
  def index
    @new_shoppinglist = Shoppinglist.new
    @shoplists = current_user.shoppinglists
  end

  def show
    @shoppinglist = Shoppinglist.find(params[:id])
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

  def paid
    shoppinglist = Shoppinglist.find(params[:id])
    shoppinglist.update(params.require(:paid_on).permit(:paid_on))
  end

  def destroy
    Shoppinglist.destroy(params[:id])
    redirect_to action: "index"
  end
end
