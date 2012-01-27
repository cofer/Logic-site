require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get standart" do
    get :standart
    assert_response :success
  end

end
