module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      element :image_tag, locator: 'img'
      collection :tags, locator: 'ul', item_locator: 'li'

      def url
        image_tag.node[:src]
      end

      def click_delete!
        node.session.dismiss_confirm do
          node.click_on 'Delete'
        end
      end

      def click_delete_and_confirm!
        node.session.accept_confirm do
          node.click_on 'Delete'
        end
      end

      def click_tag!(tag_name)
        # TODO
      end
    end
  end
end
