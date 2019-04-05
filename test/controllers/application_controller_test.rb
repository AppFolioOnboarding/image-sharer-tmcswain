require 'test_helper'
class ApplicationControllerTest < ActionDispatch::IntegrationTest
  def test_home__displays_h1_and_contains_link
    get root_url
    assert_response :success
    assert_select 'h1', 'Welcome!'
    assert_select 'a', 'New Image', href: new_image_path
  end
end
