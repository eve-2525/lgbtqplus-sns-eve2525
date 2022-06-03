class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    indexmain_worry_path(current_user) # ログイン後に遷移するpathを設定
  end

  # def after_sign_out_path_for(resource)
  #   new_user_session_path # ログアウト後に遷移するpathを設定
  # end




  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :sexual, :profile, :image])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
