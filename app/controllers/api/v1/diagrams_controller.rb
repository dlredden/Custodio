# app/controllers/api/v1/diagrams_controller.rb

module Api::V1
  class DiagramsController < ApiController

    # POST /v1/diagrams
    def create
      render json: params.to_json
    end

    # GET /v1/diagrams
    def index
      @diagrams = Diagram.includes(tables: [:columns, :referenced, :references]).find_by(:company_id => current_company)
      render :json => @diagrams.to_json(
        :include => {
          :tables => {:include => [:columns, :references, :referenced]}})
    end

  end
end