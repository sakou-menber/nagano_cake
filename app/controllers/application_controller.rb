class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
   admin_path
  end

  def after_sign_out_path_for(resource_or_scope)
    admin_path
  end
end
