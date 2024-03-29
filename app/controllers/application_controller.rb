class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 

  private

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_top_path
    else
      public_user_path(current_user)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :email])
    end
end
