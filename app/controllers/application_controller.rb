class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :set_layout

  def set_layout
    if params[:controller] =~ %r{\A(staff|admin|customer)/}
      Regexp.last_match[1]
    else
      'customer'
    end
  end
  private :set_layout
end
