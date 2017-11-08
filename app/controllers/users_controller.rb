class UsersController < ApplicationController
  def index
    @all_user = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
