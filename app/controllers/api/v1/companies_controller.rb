# app/controllers/api/v1/companies_controller.rb

module Api::V1
  class CompaniesController < ApiController

    # POST /v1/companies
    def create
      render json: params.to_json
    end

    # GET /v1/companies
    def index
      render json: Company.all
    end

  end
end