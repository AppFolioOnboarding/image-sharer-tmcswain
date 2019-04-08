require 'uri'
class Image < ApplicationRecord
  validate :valid_url

  acts_as_taggable

  def valid_url
    return if url =~ URI::DEFAULT_PARSER.make_regexp && url =~ /.jpg|.png|.svg/i
    errors.add(:url, 'must be a valid image URL')
  end
end
