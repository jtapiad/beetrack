require 'test_helper'

class MapaControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get mapa_show_url
    assert_response :success
  end

  test "should get add" do
    get mapa_add_url
    assert_response :success
  end

end
