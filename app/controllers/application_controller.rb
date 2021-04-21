class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]
  #ログイン認証が済んでいないユーザー(autheticate_user!)でトップページ以外の画面にアクセスしても
  #ログイン画面にリダイレクトする
  #before_actionメソッドは「このコントローラが動作する前に実行される」
  #それ以外のユーザー(expect:)はトップ画面([:top])へ飛ぶ
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource) #サインイン/ログインした後は
    books_path
    #投稿一覧画面へ飛ぶ
  end
  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #ユーザー登録する(sign_up)する際に、ユーザー名(name)のデータ操作を許可する
  end

end
