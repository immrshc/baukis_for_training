# ログイン時の管理者の入力フォーム
class Admin::LoginForm
  include ActiveModel::Model
  attr_accessor :email, :password
end
