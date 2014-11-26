class CommentsController < ApplicationController
  before_filter :set_comment, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  load_and_authorize_resource

  def index

    @blog = Blog.find(params[:blog_id])
    @comments = @blog.comments.paginate(:page => params[:page], :per_page => 4).order('created_at desc')
    respond_with(@comment)

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
    @blog = Blog.find(params[:blog_id])
    @user = User.find(params[:user_id])
    @comment = Comment.new(params[:comment])
    @comment.blog_id = @blog.id
    @comment.user_id = @user.id
    @comment.save

    respond_to do |format|
      format.html {redirect_to comments_url(blog_id: @blog.id)}
    end
  end

  def update
    @comment.update_attributes(params[:comment])
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  def render_comment

    @blog = Blog.find(params[:blog_id])
    @comments = @blog.comments.paginate(:page => params[:page], :per_page => 4).order('created_at desc')

    respond_to do |format|
      format.js
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
