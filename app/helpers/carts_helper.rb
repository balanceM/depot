module CartsHelper
  def set_session_cart(cart)
    session[:cart_id] = cart.id
  end
end
