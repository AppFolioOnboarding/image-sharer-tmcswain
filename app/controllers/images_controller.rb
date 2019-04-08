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

  def destroy
    image = Image.find_by(id: params[:id])
    if image.present?
      image.destroy
      flash[:success] = 'Image was successfully deleted'
    else
      flash[:error] = 'Image could not be found'
    end
    redirect_to root_path
  end

  private

  def article_params
    params.require(:image).permit(:url, :tag_list)
  end
end
