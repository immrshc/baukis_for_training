require 'rails_helper'

RSpec.describe Staff::Authenticator do
  describe "#authenticate" do
    example '正しいパスワードならtrueを返す' do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_truthy
    end

    example '誤ったパスワードならfalseを返す' do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate('wp')).to be_falsey
    end

    example '停止フラグが立っていたならtrueを返す' do
      m = build(:staff_member, suspended: true)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_truthy
    end

    example '終了後ならfalseを返す' do
      m = build(:staff_member, end_date: Date.today)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsey
    end
  end
end
