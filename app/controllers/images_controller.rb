class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(article_params)
    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def article_params
    params.require(:image).permit(:url, :tag_list)
  end
end
