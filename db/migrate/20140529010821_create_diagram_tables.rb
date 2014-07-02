class CreateDiagramTables < ActiveRecord::Migration
  def change
    create_table :diagram_tables do |t|
      t.references :diagram
      t.references :table
      t.integer :top_position
      t.integer :left_position
      t.timestamps
    end
    
    reversible do |dir|
      dir.up do
        #add a foreign key
        execute <<-SQL
          ALTER TABLE diagram_tables ADD
            CONSTRAINT fk_diagram_tables_diagram
            FOREIGN KEY (diagram_id) REFERENCES diagrams(id)
        SQL
        execute <<-SQL
          ALTER TABLE diagram_tables ADD
            CONSTRAINT fk_diagram_tables_table
            FOREIGN KEY (table_id) REFERENCES tables(id)
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE diagram_tables DROP
            FOREIGN KEY fk_diagram_tables_diagram
        SQL
        execute <<-SQL
          ALTER TABLE diagram_tables DROP
            FOREIGN KEY fk_diagram_tables_table
        SQL
      end
    end
  end
end
