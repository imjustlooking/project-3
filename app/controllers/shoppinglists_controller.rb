class ShoppinglistsController < ApplicationController
  def index
    @new_shoppinglist = Shoppinglist.new
  end

  def show

  end 
  def create
    current_user.shoppinglists.create(params.require(:shoppinglist).permit(:name_shoppinglist))
    redirect_to action: "show", id: params[:id]
  end
  def new
    @new_shoppinglist = Shoppinglist.new
  end
end
