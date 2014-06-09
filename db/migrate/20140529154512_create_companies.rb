class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.datetime :join_date
      t.boolean :is_active, :default => true

      t.timestamps
    end
  end
end
