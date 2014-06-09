class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name, null: false
      t.string :machine_name
      t.string :network_name
      t.string :ip_address
      t.boolean :is_active, :default => true 
      t.timestamps
    end
  end
end
