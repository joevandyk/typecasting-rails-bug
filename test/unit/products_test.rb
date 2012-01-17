require 'test_helper'

class ProductsTest < ActiveSupport::TestCase
  test "testing" do
    sellable = Product.create!(:name => 'sellable',
                               :sell_at => 2.years.ago,
                               :quantity => 2)

    not_sellable = Product.create!(:name => 'not sellable',
                                   :sell_at => 1.year.from_now,
                                   :quantity => 3)

    assert_equal 2, sellable.quantity
    assert_equal 3, not_sellable.quantity

    assert_equal 1, BuyableProduct.count

    puts "This is what Product looks like."
    pp sellable
    puts

    puts "This is what BuyableProduct looks like.  Note that quantity is an integer."
    pp BuyableProduct.find(sellable.id)
    puts

    assert_equal 2, BuyableProduct.find(sellable.id).quantity
  end
end
