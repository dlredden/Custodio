class Column < ActiveRecord::Base
	belongs_to :table
	has_many :referenced, through: :relationship_column, :foreign_key => "parent_column_id"
	has_many :references, through: :relationship_column, :foreign_key => "child_column_id"
end