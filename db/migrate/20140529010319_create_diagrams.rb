class CreateDiagrams < ActiveRecord::Migration
  def change
    create_table :diagrams do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
