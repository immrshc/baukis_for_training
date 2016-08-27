module ErrorHandlers extend ActiveSupport::Concern
  # エラーを定義
  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  # エラーハンドラを提供するモジュール
  included do
    rescue_from Exception, with: :rescue500
    rescue_from Forbidden, with: :rescue403
    rescue_from IpAddressRejected, with: :rescue403
    rescue_from ActionController::RoutingError, with: :rescue404
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  end
end
