class CreateDiagramTables < ActiveRecord::Migration
  def change
    create_join_table :diagrams, :tables do |t|
      t.index :diagram_id
      t.index :table_id
      t.timestamps
    end
    
    reversible do |dir|
      dir.up do
        #add a foreign key
        execute <<-SQL
          ALTER TABLE diagrams_tables ADD
            CONSTRAINT fk_diagrams_tables_diagram
            FOREIGN KEY (diagram_id) REFERENCES diagrams(id)
        SQL
        execute <<-SQL
          ALTER TABLE diagrams_tables ADD
            CONSTRAINT fk_diagrams_tables_table
            FOREIGN KEY (table_id) REFERENCES tables(id)
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE diagrams_tables DROP
            FOREIGN KEY fk_diagrams_tables_diagram
        SQL
        execute <<-SQL
          ALTER TABLE diagrams_tables DROP
            FOREIGN KEY fk_diagrams_tables_table
        SQL
      end
    end
  end
end
