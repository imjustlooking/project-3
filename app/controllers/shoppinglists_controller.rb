class ShoppinglistsController < ApplicationController
  def index
    @new_shoppinglist = Shoppinglist.new
  end

  def show
  end
  def create
    current_user.shoppinglists.create(params.require(:shoppinglist).permit(:name_shoppinglist))
    render json: current_user
  end
  def new
    @new_shoppinglist = Shoppinglist.new
  end
end
