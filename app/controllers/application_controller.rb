class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery

  def set_locale
    # 可以將 ["en", "zh-TW"] 設定為 VALID_LANG 放到 config/environment.rb 中
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end			

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if User.count == 1
        resource.add_role 'admin'
      else
        resource.add_role 'customer'
      end
      resource
    end
    root_path
  end
  def after_sign_up_path_for(resource)

  end
end
