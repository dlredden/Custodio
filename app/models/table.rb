class Table < ActiveRecord::Base
	has_many :columns
	has_and_belongs_to_many :diagrams, through: :diagram_tables
	has_many :referenced, :foreign_key => "parent_table_id", :class_name => "Relationship"
	has_many :references, :foreign_key => "child_table_id", :class_name => "Relationship"
end