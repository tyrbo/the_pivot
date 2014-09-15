class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  include SessionsHelper

  before_action :user_has_a_cart
  before_action :cart_count
  helper_method :current_supplier

  def cart
    @cart ||= Cart.find session[:cart_id]
  end

  def cart_destroy
    cart.cart_items.destroy_all
  end

  def current_supplier
    id = params[:supplier_id] || params[:id]
    Supplier.find(id)
  end

  private

  def user_has_a_cart
    return if session[:cart_id]
    reset_session
    cart = Cart.create!
    session[:cart_id] = cart.id
  end

  def cart_count
    @cart_count = cart.items.count
  end

  def must_be_user!
    redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user
  end
end
