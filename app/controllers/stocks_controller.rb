class StocksController < ApplicationController
before_action :authenticate_user!, except: :index

  def index
    @stocks = Stock.search(params[:term])
  end

  def stock_params
    params.require(:stock).permit(:name_item, :barcode)
  end

  def create
    new_stock = Stock.create(params.require(:stock).permit(:name_item, :barcode, :price, :quantity, :category_id))
    redirect_to action: "new"
  end


  def show
  end

  def new
    @new_stock = Stock.new
  end
end
