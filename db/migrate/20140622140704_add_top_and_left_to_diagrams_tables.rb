class AddTopAndLeftToDiagramsTables < ActiveRecord::Migration
  def change
    add_column :diagrams_tables, :top, :integer
    add_column :diagrams_tables, :left, :integer
  end
end
