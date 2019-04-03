require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_invalid_url
    img = Image.new(url: 'kjfdls')
    assert_not_predicate img, :valid?
    assert_equal ['must be a valid image URL'], img.errors[:url]
  end

  def test_regex_captures_png
    img = Image.new(url: 'https://www.wpclipart.com/plants/flowers/_D/dahlia/dahlia.png')
    assert_predicate img, :valid?
  end

  def test_regex_captures_jpg
    img = Image.new(url: 'https://embedwistia-a.akamaihd.net/deliveries/6aed31ef61cf95f5caad5d1a028bc7a06ce0f994.jpg?image_crop_resized=1280x720')
    assert_predicate img, :valid?
  end

  def test_regex_captures_svg
    img = Image.new(url: 'https://owips.com/sites/default/files/clipart/dahlia-clipart/461807/dahlia-clipart-dahlia-flower-461807-9423929.svg')
    assert_predicate img, :valid?
  end

  def test_regex_is_case_insensitive
    img = Image.new(url: 'https://www.whiteflowerfarm.com/mas_assets/cache/image/4/2/f/2/17138.Jpg')
    assert_predicate img, :valid?
  end

  def test_regex_fails_for_non_image
    img = Image.new(url: 'https://google.com')
    assert_not_predicate img, :valid?
  end
end
