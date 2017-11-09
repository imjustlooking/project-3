class ShoppinglistsController < ApplicationController
  def index
    @new_shoppinglist = Shoppinglist.new
    @shoplists = current_user.shoppinglists
  end

  def show
    @shoppinglist = Shoppinglist.find(params[:id])

  end
  def create
    current_user.shoppinglists.create(params.require(:shoppinglist).permit(:name_shoppinglist))
    # render :json => current_user.shoppinglists
    redirect_to action: "index"
  end
  def new
    @new_shoppinglist = Shoppinglist.new
  end

  def edit
    @shoppinglist = Shoppinglist.find(params[:id])
  end

  def update
    @shoppinglist.update(params.require(:shoppinglist).permit(:name_shoppinglist))
  end
  def destroy
  end
end
