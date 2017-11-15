class MainController < ApplicationController
  def index
    @category = Category.all
    @stocks= Stock.limit(7).order('created_at desc')
  end
end
