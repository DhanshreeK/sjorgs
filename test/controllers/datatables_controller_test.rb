require 'test_helper'

class DatatablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get datatables_index_url
    assert_response :success
  end

end
