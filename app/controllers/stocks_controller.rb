class StocksController < ApplicationController
before_action :authenticate_user!, except: :index

  def index
    @all_stocks = Stock.all
  end

  def create
    new_stock = Stock.create(params.require(:stock).permit(:name_item, :barcode, :price, :quantity, :category_id))
    redirect_to action: "new"
  end

  def new
    @new_stock = Stock.new
  end
end
