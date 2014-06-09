class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
