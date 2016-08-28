class Staff::SessionsController < Staff::Base
  # ログインフォームへの移動
  def new
    if current_staff_member
      redirect_to :staff_root
    else
      @form = Staff::LoginForm.new
      render action: 'new'
    end
  end

  # フォーム情報からのスタッフの検索、認証
  def create
    @form = Staff::LoginForm.new(params[:staff_login_form])
    # フォームのメールアドレスからStaffMemberインスタンスを検索
    if @form.email.present?
      staff_member = StaffMember.find_by(email_for_index: @form.email.downcase)
    end

    # パスワードが一致しているかどうか確認
    if Staff::Authenticator.new(staff_member).authenticate(@form.password)
      # アカウントが停止されていないか確認
      if staff_member.suspended?
        flash.now.alert = 'アカウントが停止されています。'
        render action: 'new'
      else
        session[:staff_member_id] = staff_member.id
        flash.notice = 'ログインしました。'
        redirect_to :staff_root
      end
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  # ログアウト
  def destroy
    session.delete(:staff_member_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :staff_root
  end
end
