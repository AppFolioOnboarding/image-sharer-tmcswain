module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :root

      collection :images, locator: '#TODO', item_locator: '#TODO', contains: ImageCard do
        def view!
          # TODO
        end
      end

      def add_new_image!
        node.click_on('New Image')
        window.change_to(NewPage)
      end

      def showing_image?(url:, tags: nil)
        matching_images = images.find_all { |img| img.url == url }
        return true if tags.blank? && matching_images.count.positive?

        matching_images.each do |img|
          return true if img.tags.map(&:text) == tags
        end

        false
      end
    end
  end
end
