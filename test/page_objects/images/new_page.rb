module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image
      path :images

      form_for :image do
        element :url
        element :tag_list
      end

      def create_image_expecting_failure!(img_url: nil, tags: nil)
        url.set img_url
        tag_list.set tags

        node.click_on('Create Image')
        window.change_to(NewPage)
      end

      def error_messages
        node.all('.error').map(&:text)
      end

      def create_image!(img_url: nil, tags: nil)
        url.set img_url if img_url.present?
        tag_list.set tags if tags.present?

        node.click_on('Create Image')
        window.change_to(ShowPage)
      end
    end
  end
end
