module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      element :image_tag, locator: 'img'
      collection :tags, locator: 'ul', item_locator: 'li'

      def url
        image_tag.node[:src]
      end

      def tags
        # TODO
      end

      def click_tag!(tag_name)
        # TODO
      end
    end
  end
end
