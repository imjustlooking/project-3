class StocksController < ApplicationController
before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
has_scope :category_type
  def index
    @category = Category.all
    session[:return_to] ||= request.referer
    if params[:button] == "searching"
      if Stock.search(params[:term]).order('name_item asc').length > 0
        p 'length'
        @stocks = Stock.search(params[:term]).order('name_item asc')
      else
        flash[:danger] = "No matches for '" + params[:term] + "'."
        redirect_to session.delete(:return_to)
      end
    else
      @stocks = apply_scopes(Stock).all
    end
  end

  def stock_params
    params.require(:stock).permit(:name_item, :barcode)
  end

  def create
    Stock.create(params.require(:stock).permit(:name_item, :barcode, :price, :quantity, :category_id, :img))
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
