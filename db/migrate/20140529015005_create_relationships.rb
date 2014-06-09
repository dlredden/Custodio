class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :name, null: false
      t.references :parent_table, index: true
      t.references :child_table, index: true
      t.timestamps
    end
    
    reversible do |dir|
      dir.up do
        #add a foreign key
        execute <<-SQL
          ALTER TABLE relationships ADD
            CONSTRAINT fk_relationships_parent_table
            FOREIGN KEY (parent_table_id) REFERENCES tables(id)
        SQL
        execute <<-SQL
          ALTER TABLE relationships ADD
            CONSTRAINT fk_relationships_child_table
            FOREIGN KEY (child_table_id) REFERENCES tables(id)
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE relationships DROP
            FOREIGN KEY fk_relationships_parent_table
        SQL
        execute <<-SQL
          ALTER TABLE relationships DROP
            FOREIGN KEY fk_relationships_child_table
        SQL
      end
    end
  end
end
