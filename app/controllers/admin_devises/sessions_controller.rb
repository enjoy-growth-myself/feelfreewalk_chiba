# frozen_string_literal: true

class AdminDevises::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :configure_admin_permitted_parameters, if: :devise_controller?

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
  end

   protected
  def configure_admin_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
    # sign_upの際にnameのデータ操作を許可する。
  end
end
