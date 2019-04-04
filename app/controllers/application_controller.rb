class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def home
    @urls = Image.all.order(created_at: :desc).map(&:url)
  end
end
