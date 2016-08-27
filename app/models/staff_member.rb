class StaffMember < ActiveRecord::Base
  # メールアドレスを小文字に統一する
  before_validation do
    self.email_for_index = email.downcase if email
  end

  # パスワードを暗号化
  def password=(raw_password)
    if raw_password.is_a?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end
end
