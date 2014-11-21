#encoding:utf-8
class UserInformationsController < ApplicationController
  before_filter :set_user_information, only: [:show, :edit, :update, :destroy]

  def index
    @user_informations = UserInformation.all
    
  end

  def show

  end

  def new
    @user_information = UserInformation.new
  end

  def edit
  end

  def create
    @image = AttachmentImage.new(:attachment_image=> params[:imagefile])
    @image.save
    @user_information = UserInformation.new(params[:user_information])
    @user_information.attachment_image_id = @image.id
    @user_information.user_id = current_user.id
    @user_information.save
    respond_to do |format|
      format.html {redirect_to user_informations_url ,:notice=>'修改成功!'}
    end
  end

  def update
    @user_information.update_attributes(params[:user_information])
  end

  def destroy
    @user_information.destroy
  end

  private
  def set_user_information
    @user_information = UserInformation.find(params[:id])
  end
end
