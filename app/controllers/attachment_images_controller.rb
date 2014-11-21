class AttachmentImagesController < ApplicationController
  before_filter :set_attachment_image, only: [:show, :edit, :update, :destroy]

  def index
    @attachment_images = AttachmentImage.all
    respond_with(@attachment_images)
  end

  def show
    respond_with(@attachment_image)
  end

  def new
    @attachment_image = AttachmentImage.new
    respond_with(@attachment_image)
  end

  def edit
  end

  def create
    @attachment_image = AttachmentImage.new(params[:attachment_image])
    @attachment_image.save
    respond_with(@attachment_image)
  end

  def update
    @attachment_image.update_attributes(params[:attachment_image])
    respond_with(@attachment_image)
  end

  def destroy
    @attachment_image.destroy
    respond_with(@attachment_image)
  end

  private
    def set_attachment_image
      @attachment_image = AttachmentImage.find(params[:id])
    end
end
