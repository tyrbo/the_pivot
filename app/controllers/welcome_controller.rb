class WelcomeController < ApplicationController
  def index
    @featured = FeaturedSupplier.joins(:supplier).all
  end
end
