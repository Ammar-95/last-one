require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "product attributes must not be empty" do
    product = Product.new

    assert product.invalid?
    assert product.errors.any?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product with all fields set should be valid" do

    product = Product.new({
                            title: 'string',
                            price: 10.0,
                            description: 'some text here',
                            image_url: 'http://asdasd.com/a.jpg'
    })

    assert product.valid?

  end

  test "product with a incorrect image_url is not valid" do
    product = Product.new(
      {
        title: 'string',
        price: 10.0,
        description: 'some text here',
        image_url: 'http://asdasd.com/crazy'
    })
    assert product.invalid?
    assert product.errors[:image_url].any?
  end
end
