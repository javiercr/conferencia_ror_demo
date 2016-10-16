# /app/controllers/page_controller.rb

class PageController < ApplicationController
  def index
  end

  def timeline
    @nickname = params[:nickname]
  end
end