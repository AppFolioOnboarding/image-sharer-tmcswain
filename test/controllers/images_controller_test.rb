require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_new_image_route_succeeds
    get new_image_url
    assert_response :success
    assert_select 'h1', 'Add a new image link'
  end

  def test_create_with_invalid_url_displays_error
    post images_url,
         params: { image: { url: 'test.com', tag_list: '' } }
    assert_response :success
    assert_select 'p', 'Url must be a valid image URL'
  end

  def test_create_with_valid_url_displays_img
    img_url = 'https://embedwistia-a.akamaihd.net/deliveries/6aed31ef61cf95f5caad5d1a028bc7a06ce0f994.jpg?image_crop_resized=1280x720'
    assert_difference('Image.count', 1) do
      post images_url,
           params: { image: { url: img_url, tag_list: '' } }
    end

    image = Image.last
    assert_redirected_to image
    assert_equal img_url, image.url
    assert image.tag_list.empty?
  end

  def test_create__adds_tags
    img_url = 'https://embedwistia-a.akamaihd.net/deliveries/6aed31ef61cf95f5caad5d1a028bc7a06ce0f994.jpg?image_crop_resized=1280x720'
    assert_difference %w[Image.count Image.tagged_with("flower").count Image.tagged_with("pink").count], 1 do
      post images_url,
           params: { image: { url: img_url, tag_list: 'flower, pink' } }
    end

    image = Image.last
    assert_equal %w[flower pink], image.tag_list
  end

  def test_show__displays_image_and_tags
    img_url = 'https://embedwistia-a.akamaihd.net/deliveries/6aed31ef61cf95f5caad5d1a028bc7a06ce0f994.jpg?image_crop_resized=1280x720'

    image = Image.create(url: img_url, tag_list: 'flower, pink')

    get image_path(image.id)

    assert_response :success
    assert_select 'img[src=?]', img_url
    assert_select 'ul' do
      assert_select 'li', 'flower'
      assert_select 'li', 'pink'
    end
  end

  def test_destroy
    img_url = 'https://embedwistia-a.akamaihd.net/deliveries/6aed31ef61cf95f5caad5d1a028bc7a06ce0f994.jpg?image_crop_resized=1280x720'

    image = Image.create(url: img_url, tag_list: 'flower, pink')

    assert_difference('Image.count', -1) do
      delete image_path(image)
    end
    assert_redirected_to root_path
    assert_equal 'Image was successfully deleted', flash[:success]
  end

  def test_destroy__fails_for_nonexistent_image
    assert_difference('Image.count', 0) do
      delete image_path(123_456)
    end

    assert_redirected_to root_path
    assert_equal 'Image could not be found', flash[:error]
  end
end
