class Api::V1::TestController < ApplicationController
  def index
    render json: {message: "ok"}, status: :ok
  end
end
