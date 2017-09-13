class StoreController < ApplicationController
  def index
    @count = increment_count
    @products = Product.order(:title)
    @time = Time.now
    @shown_message = "You've been here #{@count} times" if @count >5
  end

  def increment_count
    session[:counter] ||= 0
    session[:counter] += 1
  end
end
