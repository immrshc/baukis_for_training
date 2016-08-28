class Admin::SessionsController < Admin::Base
  # ログインフォームへの移動
  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: 'new'
    end
  end

  # フォーム情報からの管理者の検索、認証
  def create
    @form = Admin::LoginForm.new(params[:admin_login_form])
    # フォームのメールアドレスからAdministratorインスタンスを検索
    administrator = Administrator.find_by(email: @form.email)

    # パスワードが一致しているかどうか確認
    if Admin::Authenticator.new(administrator).authenticate(@form.password)
      # アカウントが停止されていないか確認
      if administrator.suspended?
        flash.now.alert = 'アカウントが停止されています。'
        render action: 'new'
      else
        session[:administrator_id] = administrator.id
        flash.notice = 'ログインしました。'
        redirect_to :admin_root
      end
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  # ログアウト
  def destroy
    session.delete(:administrator_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :admin_root
  end
end
