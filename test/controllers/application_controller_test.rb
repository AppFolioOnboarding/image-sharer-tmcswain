require 'test_helper'
class ApplicationControllerTest < ActionDispatch::IntegrationTest
  def test_home__displays_h1
    get root_url
    assert_response :success
    assert_select 'h1', 'Hi! Welcome!!'
  end
end
