# スタッフメンバーの認証
class Staff::Authenticator
  # 存在するユーザのStaffMemberクラスのインスタンスで初期化する
  def initialize(staff_member)
    @staff_member = staff_member
  end

  # ログイン時のパスワードが存在するユーザと一致するか確認する
  def authenticate(raw_password)
    @staff_member &&
      @staff_member.hashed_password &&
      @staff_member.start_date <= Date.today &&
      (@staff_member.end_date.nil? || @staff_member.end_date > Date.today) &&
      BCrypt::Password.new(@staff_member.hashed_password) == raw_password
  end
end
