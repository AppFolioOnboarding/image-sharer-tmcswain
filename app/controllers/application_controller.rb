class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def home
    if params[:tag].blank?
      scoped_images = Image.all
      @title = 'All Images'
    else
      scoped_images = Image.tagged_with(params[:tag])
      @title = "Images tagged '#{params[:tag]}'"
    end
    @images = scoped_images.order(created_at: :desc)
  end
end
