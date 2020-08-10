class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    user_path(current_user.id)
  end

  def after_sign_up_path_for(_resource)
    user_path(current_user.id)
  end

  # sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
  def after_sign_out_path_for(_resource)
    new_session_path(resource_name)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[name password password_confirmation])
    # sign_upの際にnameのデータ操作を許可する。
  end
end
