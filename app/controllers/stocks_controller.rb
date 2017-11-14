class StocksController < ApplicationController
before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
has_scope :category_type
  def index
    @category = Category.all
    if params[:button] == "searching"
      @stocks = Stock.search(params[:term]).order('name_item asc')
    else
      @stocks = apply_scopes(Stock).all
    end
  end

  def stock_params
    params.require(:stock).permit(:name_item, :barcode)
  end

  def create
    new_stock = Stock.create(params.require(:stock).permit(:name_item, :barcode, :price, :quantity, :category_id, :img))
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
        flash[:danger] = "Stock cannot be updated"
        render 'edit'
    end
  end

  def destroy
    Stock.destroy(params[:id])
    redirect_to action: "index"
  end
end
