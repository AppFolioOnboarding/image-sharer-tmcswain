require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  def test_home
    get root_url

    assert_response :success
    assert_select 'h1', 'Welcome!'
    assert_select 'a[href=?]', new_image_path
    assert_select 'img', 0
  end

  def test_home__displays_all_images_in_order
    urls = %w[
      https://embedwistia-a.akamaihd.net/deliveries/6aed31ef61cf95f5caad5d1a028bc7a06ce0f994.jpg?image_crop_resized=1280x720'
      https://www.thehappycatsite.com/wp-content/uploads/2017/10/best-treats-for-kittens.jpg'
      https://owips.com/sites/default/files/clipart/dahlia-clipart/461807/dahlia-clipart-dahlia-flower-461807-9423929.svg
    ]

    expected_urls = urls.reverse

    urls.each do |url|
      Image.create!(url: url)
    end

    get root_url

    assert_response :success
    assert_select 'h3', 'All Images'
    assert_select 'img' do |images|
      images.each_with_index do |img, i|
        assert_equal expected_urls[i], img.attr('src')
        assert_equal '400', img.attr('width')
      end
    end
  end

  def test_home__filters_images_by_tag
    urls = %w[
      https://embedwistia-a.akamaihd.net/deliveries/6aed31ef61cf95f5caad5d1a028bc7a06ce0f994.jpg?image_crop_resized=1280x720'
      https://www.thehappycatsite.com/wp-content/uploads/2017/10/best-treats-for-kittens.jpg'
      https://owips.com/sites/default/files/clipart/dahlia-clipart/461807/dahlia-clipart-dahlia-flower-461807-9423929.svg
    ]

    tags = %w[tag1 tag2 tag1]
    expected_urls = [urls[2], urls[0]]

    urls.each_with_index do |url, i|
      Image.create!(url: url, tag_list: tags[i])
    end

    get root_path(tag: tags[0])
    assert_response :success
    assert_select 'h3', "Images tagged '#{tags[0]}'"

    tags.uniq.each do |tag|
      assert_select 'a.js-tag-filter[href=?]', root_path(tag: tag), text: tag
    end

    assert_select 'img' do |images|
      images.each_with_index do |img, i|
        assert_equal expected_urls[i], img.attr('src')
      end
    end
  end

  def test_home__displays_nothing_for_nonexistent_tag
    urls = %w[
      https://embedwistia-a.akamaihd.net/deliveries/6aed31ef61cf95f5caad5d1a028bc7a06ce0f994.jpg?image_crop_resized=1280x720'
      https://www.thehappycatsite.com/wp-content/uploads/2017/10/best-treats-for-kittens.jpg'
      https://owips.com/sites/default/files/clipart/dahlia-clipart/461807/dahlia-clipart-dahlia-flower-461807-9423929.svg
    ]

    urls.each do |url|
      Image.create!(url: url, tag_list: '')
    end

    get root_path(tag: 'bad tag')
    assert_response :success
    assert_select 'img', 0
  end
end
