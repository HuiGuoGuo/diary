class CommentsController < ApplicationController
  before_filter :set_comment, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  load_and_authorize_resource

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit

  end

  def create
    blog = Blog.find(params[:blog_id])
    user = User.find(params[:user_id])
    @comment = Comment.new(params[:comment])
    @comment.blog_id = blog.id
    @comment.user_id = user.id
    @comment.save
  end

  def update
    @comment.update_attributes(params[:comment])
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
end
