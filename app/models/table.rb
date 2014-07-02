class Table < ActiveRecord::Base
	has_many :columns
	has_many :diagram_tables
	has_many :diagrams, through: :diagram_table
	has_many :referenced, :foreign_key => "parent_table_id", :class_name => "Relationship"
	has_many :references, :foreign_key => "child_table_id", :class_name => "Relationship"

	accepts_nested_attributes_for :diagram_tables

	# To be loaded by the Controller as it needs to know the diagram_id that requested the table
	attr_accessor :diagram_settings

	# def top
	# 	diagrams_table.find_by()
	# end
end