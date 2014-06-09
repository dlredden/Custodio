class RelationshipColumn < ActiveRecord::Base
	belongs_to :relationship
	belongs_to :parent_column, :class_name => "Column"
	belongs_to :child_column, :class_name => "Column"
end