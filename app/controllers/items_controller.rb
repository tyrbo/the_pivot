class ItemsController < ApplicationController
	def index
    @categories = Category.eager_load(:items).order(:name)
	end

  def show
    @item = Item.find(params[:id])
  end

	def search
		if params[:search] && params[:search] != ""
			@items = Item.search(params[:search])
		end
	end

end
