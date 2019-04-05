require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_new_image_route_succeeds
    get new_image_url
    assert_response :success
    assert_select 'h1', 'Add a new image link'
  end

  def test_create_with_invalid_url_displays_error
    post images_url,
         params: { image: { url: 'test.com' } }
    assert_response :success
    assert_select 'p', 'Url must be a valid image URL'
  end

  def test_create_with_valid_url_displays_img
    img_url = 'https://embedwistia-a.akamaihd.net/deliveries/6aed31ef61cf95f5caad5d1a028bc7a06ce0f994.jpg?image_crop_resized=1280x720'
    assert_difference('Image.count', 1) do
      post images_url,
           params: { image: { url: img_url } }
    end

    image = Image.last
    assert_redirected_to image
    assert_equal img_url, image.url
  end

  def test_show
    img_url = 'https://embedwistia-a.akamaihd.net/deliveries/6aed31ef61cf95f5caad5d1a028bc7a06ce0f994.jpg?image_crop_resized=1280x720'

    image = Image.create(url: img_url)

    get image_path(image.id)

    assert_response :success
    assert_select 'img[src=?]', img_url
  end
end
