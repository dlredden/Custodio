# app/controllers/api/v1/tables_controller.rb

module Api::V1
  class TablesController < ApiController

    # POST /v1/tables
    def create
      render json: params.to_json
    end

  end
end