class MainController < ApplicationController
  def index
    @category = Category.all
  end
end
