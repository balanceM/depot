require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "products attributes must be not empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "price >= 0.01" do
    product = Product.new(
      title: "aaa",
      description: "bbb",
      image_url: "7app.jpg"
    )
    product.price = -1
    assert product.invalid?
    assert_equal product.errors[:price], ["must be greater than or equal to 0.01"]
    product.price = 0
    assert product.invalid?
    assert_equal product.errors[:price], ["must be greater than or equal to 0.01"]
    product.price = 1
    assert product.valid?
  end

  test "image_url is JPG, PNG or GIF" do
    product = Product.new(
      title: "aaa",
      description: "bbb",
      price: 1
    )
    valid_arr = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    invalid_arr = %w{ fred.doc fred.gif/more fred.gif.more }
    valid_arr.each do |img_url|
      product.image_url = img_url
      assert product.valid?
    end
    invalid_arr.each do |img_url|
      product.image_url = img_url
      assert product.invalid?
    end
  end

  test "product is not valid without unique title" do
    product = Product.new(
      title: products(:ruby).title,
      description: "xxxx",
      image_url: "7app.jpg",
      price: 1
    )
    assert product.invalid?
    assert_equal product.errors[:title], ["has already been taken"]
  end

  test "product is not valid without a unique title - I18n" do
    product = Product.new(
      title: products(:ruby).title,
      description: "xxxx",
      price: 1,
      image_url: "fred.gif"
    )
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
    product.errors[:title]
  end
end
