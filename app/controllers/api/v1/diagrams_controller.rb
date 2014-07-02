# app/controllers/api/v1/diagrams_controller.rb

module Api::V1
  class DiagramsController < ApiController

    # POST /v1/diagrams
    def create
      render json: params.to_json
    end

    # GET /v1/diagrams
    def index
      @diagrams = Diagram.includes(tables: [:columns, :referenced, :references]).where(company_id: current_company)
      load_diagram_settings(@diagrams)
      render :json => @diagrams.to_json(
        :methods => [:active],
        :include => {
          :tables => {
            :include => [:columns, :referenced, :references, :diagram_settings]}})
    end

    def load_diagram_settings(diagram_list)
      diagram_list.each do |d|
        if (d.name == "Default")
          d.active = true
        end

        d.tables.each do |t|
          t.diagram_settings = DiagramTable.find_by(:diagram_id => d.id, :table_id => t.id)
        end
      end
    end

    private :load_diagram_settings
  end
end