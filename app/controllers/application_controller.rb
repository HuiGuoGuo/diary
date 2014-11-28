class ApplicationController < ActionController::Base
  protect_from_forgery
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
