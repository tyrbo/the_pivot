class ItemsController < ApplicationController
	def index
		@items = (Item.not_retired_too + Item.not_retired)
	end

  def show
    @item = Item.find(params[:id])
  end
end
