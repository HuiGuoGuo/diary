class HomeController < ApplicationController
#  before_filter :authenticate_user!
  #
  def index
  end

  def sign_out
    redirect_to "http://www.baidu.com"
  end
end
