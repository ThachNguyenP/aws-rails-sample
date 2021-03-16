class HealthCheckController < ApplicationController
  def index
    render json: {"health_check": "good"}
  end
end
