require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "get index" do
    get pages_url

    assert_equal "index", @controller.action_name
    assert_match "ID", @response.body
  end

  test "correct routes" do
    assert_routing '/',
      {:controller => "pages", :action => "index"}
    assert_routing '/print_weight',
      {:controller => "pages", :action => "print_weight"}
    assert_routing(
      {:method => 'post', :path => '/pages'},
      {:controller => 'pages', :action => 'create'}
    )
  end

  test "correct response from print_weight" do
    https!
    get "/print_weight?user_id=9c9b918d-cab9-41b6-af38-824614e322f8"

    assert_response :success
    assert_equal "application/json", @response.media_type
  end

end
