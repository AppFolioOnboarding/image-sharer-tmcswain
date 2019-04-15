module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image

      element :image

      def image_url
        image.node[:src]
      end

      def tags
        element(locator: 'ul').node.all('li').map(&:text)
      end

      def go_back_to_index!
        node.click_on('Home')
        window.change_to(IndexPage)
      end
    end
  end
end
