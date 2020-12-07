# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_current_location, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_search


  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
      flash[:notice] = '新規登録完了しました。次に大学情報を入力してください'
      new_users_main_registration_path  # 　指定したいパスに変更
    else
      flash[:notice] = 'ログインに成功しました'
      root_url # 　指定したいパスに変更
    end
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  private

  # フレンドリーフォワーディング機能
  def store_current_location
    return if current_user

    store_location_for(:user, request.url)
  end

  def set_search
    @q = Item.ransack(params[:q])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
  end
end
