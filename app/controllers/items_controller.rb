class ItemsController < ApplicationController
	def index
    @categories = Category.eager_load(:items).order(:name)
	end

  def show
    @item = Item.find(params[:id])
  end
end
