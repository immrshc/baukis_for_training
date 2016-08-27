class ErrorsController < ApplicationController
  def routing_error
    raise ApplicationController::RoutingError,
      "No route matches #{request.path.inspect}"
  end
end
