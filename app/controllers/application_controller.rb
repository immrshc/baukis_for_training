class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # テンプレートを埋め込むレイアウトのapp/views/layouts/ファイル名を指定
  layout :set_layout
  def set_layout
    if params[:controller] =~ %r{\A(staff|admin|customer)/}
      Regexp.last_match[1]
    else
      'customer'
    end
  end
  private :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  rescue_from Exception, with: :rescue500
  def rescue500(e)
    @exception = e
    render 'errors/internal_server_error', status: 500
  end
  private :rescue500

  rescue_from Forbidden, with: :rescue403
  rescue_from IpAddressRejected, with: :rescue403
  def rescue403(e)
    @exception = e
    render 'errors/forbidden', status: 403
  end
  private :rescue403

  rescue_from ActionController::RoutingError, with: :rescue404
  rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  def rescue404(e)
    @exception = e
    render 'errors/not_found', status: 404
  end
end
