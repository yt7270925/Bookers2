class ApplicationController < ActionController::Base
  # ログインで使う値から外したemailを許可する
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後の遷移先
  def after_sign_in_path_for(resource)
    about_path #後でBookのindexに変える
  end

  # ログアウト後の遷移先 デフォルトはルートパスであるから後で消す
  def after_sign_out_path_for(resource)
    about_path #後でトップページに変える
    # root_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end

end
