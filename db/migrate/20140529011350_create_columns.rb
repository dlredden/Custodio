class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.references :table, index: true
      t.string :name, null: false
      t.integer :ordinal_position, null: false
      t.string :default_value, null: true
      t.string :data_type, null: false
      t.boolean :is_nullable, default: true
      t.boolean :is_primary_key, default: false
      t.boolean :is_auto_increment, default: false
      t.timestamps
    end
    
    reversible do |dir|
      dir.up do
        #add a foreign key
        execute <<-SQL
          ALTER TABLE columns ADD
            CONSTRAINT fk_columns_table
            FOREIGN KEY (table_id) REFERENCES tables(id)
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE columns DROP
          FOREIGN KEY fk_columns_table
        SQL
      end
    end
  end
end
