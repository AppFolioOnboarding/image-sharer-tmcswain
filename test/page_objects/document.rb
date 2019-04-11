module PageObjects
  class Document < AePageObjects::Document
    def flash_message(message_type)
      element(locator: "##{message_type}").text
    end
  end
end
