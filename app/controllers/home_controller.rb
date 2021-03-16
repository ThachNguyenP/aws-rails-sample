class HomeController < ApplicationController
  def index
    render json: {"home": "index"}
  end
end
