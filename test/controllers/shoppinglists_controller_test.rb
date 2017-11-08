require 'test_helper'

class ShoppinglistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shoppinglists_index_url
    assert_response :success
  end

end
