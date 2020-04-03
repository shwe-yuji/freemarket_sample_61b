require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get products_new_url
    @products = Product.all
    assert_response :success
  end

  test '検索します' do
    get products_search_url
    @products = Product.all
    assert_response :success
  end
end
