class ApplicationController < ActionController::API
  def send_403!
    render json: { error: "This page doesn't exist." }, status: :forbidden
  end
end
