# app/controllers/api/v1/servers_controller.rb

module Api::V1
  class ServersController < ApiController

    # POST /v1/servers
    def create
      render json: params.to_json
    end

    # GET /v1/servers
    def index
      render json: Server.all
    end

  end
end