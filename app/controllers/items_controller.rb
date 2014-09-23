class ItemsController < ApplicationController
	before_action :set_categories

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

	def set_categories
		@categories = Category.all
	end

end
