require 'test_helper'

class WorryControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get worry_top_url
    assert_response :success
  end

end
