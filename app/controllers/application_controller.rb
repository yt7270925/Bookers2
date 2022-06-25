class ApplicationController < ActionController::Base
  # ログインで使う値から外したemailを許可する
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end

end
