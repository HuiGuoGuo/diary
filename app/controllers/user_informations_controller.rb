#encoding:utf-8
class UserInformationsController < ApplicationController
  load_and_authorize_resource
  before_filter :set_user_information, only: [:show, :edit, :update, :destroy, :render_user_information]

  def index
    @user_informations = UserInformation.all
    
  end

  def show
    if params[:id]
    else
      @user_information = current_user.user_information
    end
  end

  def new
    @user_information = UserInformation.new
  end

  def edit
     @user = User.find(current_user.id)
  end

  def create
    @image = AttachmentImage.new(:attachment_image=> params[:imagefile])
    @image.save
    @user_information = UserInformation.new(params[:user_information])
    @user_information.attachment_image_id = @image.id
    @user_information.user_id = current_user.id
    @user_information.save
  end

  def update
    @user_information.update_attributes(params[:user_information])

    if params[:imagefile].blank? || params[:imagefile].original_filename.eql?(@user_information.attachment_image.attachment_image_file_name)

    else
      @image = AttachmentImage.new(:attachment_image=> params[:imagefile])
      @image.save  
      @user_information.attachment_image_id = @image.id
      @user_information.save 
    end

    respond_to  do |format|
      format.html {redirect_to user_information_path(@user_information)}
    end

  end

  def destroy
    @user_information.destroy
  end

  def render_user_information
    render :partial => 'render_user_information'
  end

  private
  def set_user_information
    @user_information = UserInformation.find(params[:id])
  end

end
