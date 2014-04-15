require 'test_helper'

class ManageProductTest < ActionDispatch::IntegrationTest
  def test_new_product
   visit "/admin/products"
   fill_in "Email", with: 'admin@example.com'
   fill_in "Password", with: 'test'
   click_on "Log In"
   click_on "New Product"
   fill_in "Name", with: "Shoes"
   fill_in "Price", with: 15
   click_on "Save"
   # assert_equal 'Product 1 was created.', flash[:notice]
   assert page.has_content?(/Product.*was created./)
   click_on "Shoes"
   click_on "edit"
   fill_in "Price", with: 27
   click_on "Save"
   product = Product.last
   assert_equal 27, product.price
   assert page.has_content?(/Product.*was updated./)
   click_on "Shoes"
   click_on "delete"
   product = Product.last
   assert_equal nil, product
   puts product
   assert page.has_content?(/Product.*was deleted./)
   save_and_open_page
  end
end

