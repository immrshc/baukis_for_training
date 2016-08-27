# TopPage
class Staff::TopController < ApplicationController
  def index
    raise ActiveRecord::RecordNotFound
    render action: 'index'
  end
end
