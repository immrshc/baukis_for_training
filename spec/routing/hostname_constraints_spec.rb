require 'rails_helper'

describe 'ルーティング' do
  example '職員トップページ' do
    expect(get: 'http://localhost:3000').to route_to(
      host: 'localhost',
      controller: 'staff/top',
      action: 'index'
    )
  end

  example '管理者ログインフォーム' do
    expect(get: 'http://localhost:3000/admin/login').to route_to(
      host: 'localhost',
      controller: 'admin/sessions',
      action: 'new'
    )
  end

  example '顧客トップページ' do
    expect(get: 'http://localhost:3000/mypage').to route_to(
      host: 'localhost',
      controller: 'customer/top',
      action: 'index'
    )
  end
end
