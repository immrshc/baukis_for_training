class Admin
  # toppage
  class TopController < ApplicationController
    def index
      render action: 'index'
    end
  end
end
