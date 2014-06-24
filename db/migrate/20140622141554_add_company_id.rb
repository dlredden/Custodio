class AddCompanyId < ActiveRecord::Migration
  def change 
  	add_column :diagrams, :company_id, :integer
  	add_column :servers, :company_id, :integer
  end
end
