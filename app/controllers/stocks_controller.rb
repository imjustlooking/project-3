class StocksController < ApplicationController
before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  def index
    @stocks = Stock.search(params[:term]).order('name_item asc')
  end

  def stock_params
    params.require(:stock).permit(:name_item, :barcode)
  end

  def create
    new_stock = Stock.create(params.require(:stock).permit(:name_item, :barcode, :price, :quantity, :category_id))
    redirect_to action: "index"
  end

  def show
    @new_item = Item.new
  end

  def new
    @new_stock = Stock.new
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
      if Stock.find(params[:id]).update(params.require(:stock).permit(:name_item, :barcode, :price, :category_id, :img))
        redirect_to action: "index"
      else
        flash[:alert] = "Stock cannot be updated"
        render 'edit'
    end
  end

  def destroy
    Stock.destroy(params[:id])
    redirect_to action: "index"
  end
end
