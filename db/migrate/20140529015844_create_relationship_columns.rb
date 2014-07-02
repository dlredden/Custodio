class CreateRelationshipColumns < ActiveRecord::Migration
  def change
    create_table :relationship_columns do |t|
      t.references :parent_column
      t.references :child_column
      t.references :relationship
      t.integer :ordinal_position, null: false
      t.timestamps
    end
    
    reversible do |dir|
      dir.up do
        #add a foreign key
        execute <<-SQL
          ALTER TABLE relationship_columns ADD
            CONSTRAINT fk_relationship_columns_relationships
            FOREIGN KEY (relationship_id) REFERENCES relationships(id)
        SQL
        execute <<-SQL
          ALTER TABLE relationship_columns ADD
            CONSTRAINT fk_relationship_columns_child_column
            FOREIGN KEY (child_column_id) REFERENCES columns(id)
        SQL
        execute <<-SQL
          ALTER TABLE relationship_columns ADD
            CONSTRAINT fk_relationship_columns_parent_column
            FOREIGN KEY (parent_column_id) REFERENCES columns(id)
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE relationship_columns DROP
            FOREIGN KEY fk_relationship_columns_relationships
        SQL
        execute <<-SQL
          ALTER TABLE relationship_columns DROP
            FOREIGN KEY fk_relationship_columns_child_column
        SQL
        execute <<-SQL
          ALTER TABLE relationship_columns DROP
            FOREIGN KEY fk_relationship_columns_parent_column
        SQL
      end
    end
  end
end
