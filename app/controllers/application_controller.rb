class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.last_sign_in_at != nil
      flash[:notice] = "ログインに成功しました"
      root_url  #　指定したいパスに変更
    else
      flash[:notice] = "新規登録完了しました。次に名前を入力してください"
      new_users_main_registration_path(resource)  #　指定したいパスに変更
    end
  end
end
