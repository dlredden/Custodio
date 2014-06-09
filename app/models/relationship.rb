class Relationship < ActiveRecord::Base
	belongs_to :parent_table, :class_name => "Table"
	belongs_to :child_table, :class_name => "Table"
	has_many :parent_columns, through: :relationship_columns, :class_name => "Column"#, -> { order "ordinal_position"}
	has_many :child_columns, through: :relationship_columns, :class_name => "Column"#, -> { order "ordinal_position"}
end